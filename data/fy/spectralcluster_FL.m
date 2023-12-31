function [idx,V,D] = spectralcluster(X,k,varargin)
%SPECTRALCLUSTER Spectral clustering.
%   IDX = SPECTRALCLUSTER(X, K) partitions the points in the N-by-P data
%   matrix X into K clusters. Rows of X correspond to observations, columns
%   correspond to variables. SPECTRALCLUSTER returns an N-by-1 vector IDX
%   containing the cluster indices of each point.
%
%   IDX = SPECTRALCLUSTER(S, K, 'DISTANCE', 'PRECOMPUTED') is an
%   alternative syntax that accepts a similarity matrix S instead of raw
%   data. S must be a square and symmetric matrix of size NxN, where N is
%   the number of observations.
%
%   [IDX, V] = SPECTRALCLUSTER(...) returns the eigenvectors V
%   corresponding to the K-smallest eigenvalues of the graph Laplacian.
%
%   [IDX, V, D] = SPECTRALCLUSTER(...) returns a vector D containing the
%   K-smallest eigenvalues of the graph Laplacian
%
%   [...] = SPECTRALCLUSTER(..., 'PARAM1',val1, 'PARAM2',val2, ...)
%   specifies optional parameter name/value pairs to control the algorithm
%   used by SPECTRALCLUSTER. Parameters are:
%
%   'Distance'      -   A distance metric which can be any of the distance 
%                       measures accepted by the KNNSEARCH function. The 
%                       default is 'euclidean'. For more information on 
%                       KNNSEARCH and available distances, type HELP KNNSEARCH. 
%                       An additional choice is:
%       'precomputed'   -   Needs to be specified when a custom similarity
%                           matrix is passed in
%
%   
%
%   'P'            -   A positive scalar indicating the exponent of Minkowski
%                       distance. This argument is only valid when 'Distance'
%                       is 'minkowski'. Default is 2.
%  
%   'Cov'          -   A positive definite matrix indicating the covariance
%                       matrix when computing the Mahalanobis distance. This
%                       argument is only valid when 'Distance' is
%                       'mahalanobis'. Default is NANCOV(X).
%  
%   'Scale'        -   A vector containing nonnegative values, with
%                       length equal to the number of columns in X. This
%                       argument is only valid when 'Distance' is
%                       'seuclidean'. Default is NANSTD(X).
%
%   'LaplacianNormalization' -  Method to normalize the
%                               Laplacian matrix L which is used to compute
%                               eigenvectors. Choices are:
%          'randomwalk'      -  Normalize L by inv(D_g)*L as in Shi et al.
%                               [1].
%                               D_g is the degree matrix. (default)
%          'symmetric'       -  Normalize L by D_g^(-1/2)*L*D_g^(-1/2) as 
%                               in Ng et al. [2].
%          'none'            -  Use L without normalization.
%
%  'SimilarityGraph' -  Type of graph similarity graph. Choices are:
%          'knn'        - Construct graph using nearest neighbors 
%                       (the default).
%          'epsilon'    - Construct graph using radius search. You must
%                       specify a value for Radius if you use this option.
%
%   'NumNeighbors' -    A positive integer, specifying the number of
%                       nearest neighbors used to construct the similarity
%                       graph. SimilarityGraph must be equal to knn (Default
%                       is log(size(X,1)))
%
%   'KNNGraphType' -    Type of nearest neighbor graph. Choices are:
%          'complete' - Two points are said to be connected when either 1
%                       is a Nearest-Neighbor of 2 OR vice versa (the
%                       default)
%          'mutual'   - Two points are said to be connected when 1
%                       is a Nearest-Neighbor of 2 AND vice versa
%
%   'Radius'        -   A nonnegative scalar, specifying the radius of the
%                       nearest neighbors search query used to construct
%                       the similarity graph. SimilarityGraph must be equal
%                       to epsilon. You must specify a value for Radius if
%                       SimilarityGraph is equal to epsilon.
%
%   'KernelScale'   -   Either string 'auto' or positive scalar specifying
%                       the scale factor. If you pass 'auto', SPECTRALCLUSTER
%                       selects an appropriate scale factor using a
%                       heuristic procedure. The 'auto' option is supported
%                       only for 'euclidean' and 'seuclidean' distances.
%                       Default: 1
%                       NOTE: The heuristic procedure for estimation of
%                           the scale factor uses subsampling. Estimates
%                           obtained by this procedure can vary from one
%                           application of SPECTRALCLUSTER to another. Set
%                           the random number generator seed prior to
%                           calling SPECTRALCLUSTER for reproducibility.
%
%   'ClusterMethod' -   Type of clustering method. Choices are:
%           'kmeans'    - Cluster eigenvectors using kmeans (default)
%           'kmedoids'  - Cluster eigenvectors using kmedoids
%
%   Example:
%      % Find 2 clusters in data X, using the default distance metric 
%      % 'euclidean'.
%      X = [rand(20,2)+2; rand(20,2)];
%      idx = spectralcluster(X,2);
%
%   See also KMEANS, KMEDOIDS, KNNSEARCH.
%
%   References
%   [1] Shi, J., and J. Malik. "Normalized cuts and image segmentation."
%   IEEE Transactions on Pattern Analysis and Machine Intelligence. Vol.
%   22, 2000, pp. 888-905.
%   [2] Ng, A.Y., M. Jordan, and Y. Weiss. "On spectral clustering: Analysis
%   and an algorithm." In Proceedings of the Advances in Neural Information
%   Processing Systems 14. MIT Press, 2001, pp. 849-856.
%   [3] Von Luxburg, U. "A Tutorial on Spectral Clustering." Statistics and
%   Computing Journal. Vol.17, Number 4, 2007, pp.395-416. 

%   Copyright 2019 The MathWorks, Inc.


% Parse input arguments
if nargin > 2
    [varargin{:}] = convertStringsToChars(varargin{:});
end

funcName = mfilename;
% Validate X and k
validateattributes(X,{'single','double'},{'2d','real','nonempty'},'','X');
validateattributes(k,{'single','double'},{'scalar','integer','nonempty',...
    'nonsparse','positive'},funcName,'k');

% Parse Name-Value pairs
pnames = {'LaplacianNormalization','ClusterMethod','Distance'};
dflts =  {'randomwalk','kmeans','euclidean'};
[lapNorm, clustMethod, dist, ~, varargin] =...
     internal.stats.parseArgs(pnames, dflts, varargin{:});

% Validate cluster method here. Other Name-Value pairs are validated in
% internal routines
clustMethod = validatestring(clustMethod,{'kmeans','kmedoids'},funcName,'ClusterMethod');

% Allowed distances
if ischar(dist)
    validDists = {'euclidean'; 'seuclidean'; 'cityblock'; 'chebychev'; ...
        'mahalanobis'; 'minkowski'; 'cosine'; 'correlation'; ...
        'spearman'; 'hamming'; 'jaccard'; 'precomputed'};
    dist = validatestring(dist,validDists,funcName,'Distance');
end

% Preallocate idx and V
N = size(X,1);
idx = zeros(N,1);
V = zeros(N,k);

% Check for NaNs in the data
isXNaN = any(isnan(X),2);

% Construct a similarity matrix only if distance is not precomputed
if ~strcmpi(dist,'precomputed')
    % Filter NaNs in X
    if any(isXNaN)
        warning(message('stats:spectralcluster:MissingDataRemoved'));
        X = X(~isXNaN,:);
        idx(isXNaN) = nan;
        V(isXNaN,:) = nan;
    end
    
    % Compute the Similarity Matrix
    X = internal.stats.similarity(X,'Distance',dist,varargin{:});
end

% X2=eye(14,14);
% 
% X2(2,3)=1;
% X2(3,2)=1;
% X2(12,3)=1;
% X2(3,12)=1;
% X2(13,14)=1;
% X2(14,13)=1;
% X2(1,2)=0.5;
% X2(2,1)=0.5;
% X2(2,5)=0.5;
% X2(5,2)=0.5;
% X2(2,8)=0.5;
% X2(8,2)=0.5;
% X2(2,14)=0.5;
% X2(14,2)=0.5;
% X2(4,9)=0.5;
% X2(9,4)=0.5;
% X2(5,10)=0.5;
% X2(10,5)=0.5;
% X2(5,11)=0.5;
% X2(11,5)=0.5;
% X2(5,14)=0.5;
% X2(14,5)=0.5;
% X2(6,7)=0.5;
% X2(7,6)=0.5;
% X2(6,11)=0.5;
% X2(11,6)=0.5;
% X2(7,11)=0.5;
% X2(11,7)=0.5;
% X2(10,11)=0.5;
% X2(11,10)=0.5;

% adjacency matrix based on the impedance
% X2(2,3)= 1/abs(0.1587 + 0.0587i);   % 702-705
% X2(3,2)= 1/abs(0.1587 + 0.0587i);
% X2(12,3)= 1/abs(0.1269 + 0.0470i);  % 742-705
% X2(3,12)= 1/abs(0.1269 + 0.0470i);  
% X2(13,14)=1/abs(0.0686 + 0.0356i);  % 744-727
% X2(14,13)=1/abs(0.0686 + 0.0356i);
% X2(1,2)=1/abs(0.1889 + 0.1232i); % 799-702
% X2(2,1)=1/abs(0.1889 + 0.1232i);
% X2(2,5)=1/abs(0.3148 + 0.1760i); % 702-709
% X2(5,2)=1/abs(0.3148 + 0.1760i);
% X2(2,8)=1/abs(0.2473 + 0.1236i); % 702-714
% X2(8,2)=1/abs(0.2473 + 0.1236i);
% X2(2,14)=1/abs(0.2141 + 0.1096i); % 702-727
% X2(14,2)=1/abs(0.2141 + 0.1096i);
% X2(4,9)= 1/abs(0.6231 + 0.2526i); % 707-725
% X2(9,4)= 1/abs(0.6231 + 0.2526i); 
% X2(5,10)=1/abs(0.2053 + 0.0877i); % 709-732
% X2(10,5)=1/abs(0.2053 + 0.0877i);
% X2(5,11)=1/abs(0.1567 + 0.0813i); % 709-733
% X2(11,5)=1/abs(0.1567 + 0.0813i);
% X2(5,14)=1/abs(0.2913 + 0.1370i); % 709-727
% X2(14,5)=1/abs(0.2913 + 0.1370i);
% X2(6,7)= 1/abs(0.5591 + 0.2595i); % 710-711
% X2(7,6)= 1/abs(0.5591 + 0.2595i);
% X2(6,11)=1/abs(0.3436 + 0.1476i); % 710 - 733
% X2(11,6)=1/abs(0.3436 + 0.1476i);
% X2(7,11)=1/abs(0.4900 + 0.2543i); % 733 - 711
% X2(11,7)=1/abs(0.4900 + 0.2543i);
% X2(10,11)=1/abs(0.2053 + 0.0877i); % 732 - 733
% X2(11,10)=1/abs(0.2053 + 0.0877i);


% 123 node sensor matrix
X2 = eye(51,51);


X2 = abs(X2);

X = 0.2*X+X2;


% Check if k is greaer than number of rows of X
if k > size(X,1)
    error(message('stats:spectralcluster:TooManyClusters'));
end

% Obtain the eigenvectors and eigenvalues
[Vnonan,D] = internal.stats.spectraleigs(X,k,lapNorm);

% Cluster the data and return indices
labels = clusterEigenvectors(Vnonan,k,clustMethod);

% Update rows without NaNs for idx and V
idx(~isXNaN) = labels;
V(~isXNaN,:) = Vnonan;
end

function [idx] = clusterEigenvectors(V,k,clustMethod)
% Cluster eigenvectors V into k clusters and return cluster indices idx

switch clustMethod
    case 'kmeans'
        idx = kmeans(V,k,'Replicates',5);
    case 'kmedoids'
        idx = kmedoids(V,k,'Replicates',5);
end
end


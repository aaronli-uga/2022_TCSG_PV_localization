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


% 123 node sensor matrix

X2 = eye(51,51);
% node 1
X2(1, 45) = 1;
X2(1, 2) = 1;
X2(1, 4) = 0.5;

% node 3
X2(2, 1) = 1;
X2(2, 3) = 1;

% node 5
X2(3, 2) = 1;

% node 8
X2(4, 1) = 0.5;
X2(4, 5) = 0.5;
X2(4, 6) = 0.5;
X2(4, 46) = 0.5;
X2(4, 44) = 0.5;

% node 14
X2(5, 4) = 0.5;

% node 15
X2(6, 4) = 0.5;
X2(6, 46) = 0.5;

% node 19
X2(7, 8) = 0.5;
X2(7, 44) = 0.5;

% node 21
X2(8, 7) = 0.5;
X2(8, 9) = 1;

% node 23
X2(9, 10) = 0.5;
X2(9, 11) = 0.5;
X2(9, 12) = 0.5;
X2(9, 8) = 1;

% node 27
X2(10, 9) = 0.5;
X2(10, 12) = 0.5;

% node 29
X2(11, 49) = 0.5;
X2(11, 9) = 0.5;

% node 31
X2(12, 10) = 0.5;
X2(12, 9) = 0.5;

% node 36
X2(13, 14) = 1;
X2(13, 15) = 0.5;
X2(13, 44) = 0.5;

% node 38
X2(14, 13) = 1;

% node 40
X2(15, 16) = 1;
X2(15, 13) = 0.5;
X2(15, 44) = 0.5;

% node 42
X2(16, 15) = 1;
X2(16, 17) = 0.5;
X2(16, 18) = 0.5;

% node 45
X2(17, 16) = 0.5;
X2(17, 18) = 0.5;

% node 47
X2(18, 16) = 0.5;
X2(18, 17) = 0.5;
X2(18, 19) = 0.5;

% node 50
X2(19, 18) = 0.5;

% node 53
X2(20, 21) = 0.5;
X2(20, 22) = 0.5;
X2(20, 46) = 0.5;

% node 55
X2(21, 20) = 0.5;
X2(21, 22) = 0.5;

% node 58
X2(22, 20) = 0.5;
X2(22, 21) = 0.5;
X2(22, 23) = 0.5;

% node 60
X2(23, 24) = 0.5;
X2(23, 22) = 0.5;
X2(23, 47) = 1;

% node 62
X2(24, 23) = 0.5;
X2(24, 25) = 0.5;

% node 65
X2(25, 24) = 0.5;

% node 67
X2(26, 47) = 0.5;
X2(26, 27) = 0.5;
X2(26, 28) = 1;
X2(26, 38) = 0.5;
X2(26, 48) = 0.5;

% node 70
X2(27, 26) = 0.5;

% node 72
X2(28, 26) = 1;
X2(28, 29) = 0.5;
X2(28, 30) = 0.5;
X2(28, 33) = 0.5;

% node 74
X2(29, 28) = 0.5;

% node 78
X2(30, 28) = 0.5;
X2(30, 31) = 0.5;
X2(30, 32) = 0.5;

% node 82
X2(31, 30) = 0.5;
X2(31, 32) = 0.5;

% node 84
X2(32, 30) = 0.5;
X2(32, 31) = 0.5;

% node 87
X2(33, 28) = 0.5;
X2(33, 34) = 1;

% node 89
X2(34, 33) = 1;
X2(34, 35) = 1;

% node 91
X2(35, 34) = 1;
X2(35, 36) = 1;

% node 93
X2(36, 35) = 1;
X2(36, 37) = 1;

% node 95
X2(37, 36) = 1;

% node 99
X2(38, 26) = 0.5;
X2(38, 51) = 0.5;
X2(38, 48) = 0.5;

% node 103
X2(39, 40) = 0.5;
X2(39, 48) = 0.5;

% node 105
X2(40, 41) = 1;
X2(40, 39) = 0.5;
X2(40, 42) = 0.5;
X2(40, 48) = 0.5;
X2(40, 50) = 0.5;

% node 106
X2(41, 40) = 1;

% node 110
X2(42, 40) = 0.5;
X2(42, 43) = 0.5;
X2(42, 50) = 0.5;

% node 113
X2(43, 42) = 0.5;

% node 135
X2(44, 13) = 0.5;
X2(44, 15) = 0.5;
X2(44, 7) = 0.5;
X2(44, 4) = 0.5;

% node 149
X2(45, 1) = 1;

% node 152
X2(46, 20) = 0.5;
X2(46, 4) = 0.5;
X2(46, 6) = 0.5;

% node 160
X2(47, 26) = 0.5;
X2(47, 23) = 1;

% node 197
X2(48, 40) = 0.5;
X2(48, 39) = 0.5;
X2(48, 38) = 0.5;
X2(48, 26) = 0.5;

% node 250
X2(49, 11) = 0.5;

% node 300
X2(50, 42) = 0.5;
X2(50, 40) = 0.5;

% node 450
X2(51, 38) = 0.5;



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


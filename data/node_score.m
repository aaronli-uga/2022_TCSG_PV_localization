% calculate the node IF score.
function [ISlist, timelist] = node_score(tt, start_time, step, time_step, ws)
    ISlist = [];
    timelist = [start_time];
    for i = 1+step : step : length(tt) - ws
        c_cc = tt(1, i:i+ws);
        p_cc = tt(1, i-step:i-step+ws);             

        SE = -sum(c_cc.^2.*log(c_cc.^2));
        S = std(c_cc);
        R = range(c_cc);
        MD = abs(mean(p_cc) - mean(c_cc));
        CF = abs(max(c_cc)) / mean(c_cc.^2);

    %   The entropy has been removed to get a better result.
        IS = (CF) * (S + R + MD);
        ISlist = [ISlist, IS];
        timelist = [timelist, timelist(end)+time_step];
    end
end

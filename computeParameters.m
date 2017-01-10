function [N, sigma] = computeParameters(I, fraction)
    [h,w] = size(I);
    sigma = fraction * min(h,w);
    N = 4 * sqrt(2) * sigma;
    sigma = round(sigma);
    N = round(N);
    
    if mod(N,2) == 0
        N = N + 1;
    end
end


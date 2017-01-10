function M = logMask(N, sigma)
    M = zeros(N,N);
    N = floor(N/2);
    for i = -N:N
        for j = -N:N
           xy = (i^2+j^2) / (2*sigma^2);
           M(i+N+1,j+N+1) = -1 / (pi*sigma^4) * (1-xy)*exp(-xy);
        end
    end
end


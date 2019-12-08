function [x] = myDecompression(y,N)
x = zeros(N,1);

for n = 1:N
    x(n) = 0;
    for k = 1:N
        if k==1
            w(k) = 1/sqrt(N);
        else
            w(k) = sqrt(2/N);
        end
        x(n) = x(n) + w(k)*y(k)*cos(pi*((2*n)-1)*(k-1)/(2*N));
    end
end
end


function [y]= myCompression(a,N)
y = zeros(N,1);
for k = 1:N
    if k==1
        w(k)=1/sqrt(N);
    else
        w(k)=sqrt(2/N);
    end
    temp=0;
    for n=1:N
        temp=temp+a(n)*cos(pi*((2*n)-1)*(k-1)/(2*N));
    end
    y(k)=w(k)*temp;
end
end


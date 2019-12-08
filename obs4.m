clc;
clear all;
close all;
sgtitle("17ucc038");
th1 = [0.09 0.5 0.01];
th2 = [-0.09 -0.5 -0.01];
ydcom = zeros(256^2,1);

[y,Fs] = audioread('input.wav');
y = y(1:65536);
for k=1:3
    count = 0;
    m(k) = 0;
    comp(k) = 0;
    for i = 1:256 %I have reduced the size of loop, it should have been length(y)
        ycom = dct(y((i-1)*256+1:i*256));
            for j=1:256
                if ((ycom(j) < th1(k))  && (ycom(j) > th2(k)))
                    ycom(j) = 0;
                    count = count+1;
                end
            end

    ydcom((i-1)*256+1:i*256) = idct(ycom);
    end
filename = "outputforDiffThreshold.wav";
audiowrite(filename,ydcom,Fs);
m(k) = mse(y,ydcom);
comp(k) = ((256*256) - count)/(256*256);
%sound(ydcom,Fs);
end
subplot(2,1,1);
stem(th1,m);
xlabel("threshold values");
ylabel("MSE");


subplot(2,1,2);
stem(th1,comp);
xlabel("threshold values");
ylabel("Compression Ratio");


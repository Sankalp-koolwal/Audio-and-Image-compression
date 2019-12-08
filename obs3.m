clc;
clear all;
close all;

th1 = [0.09 0.5 0.01];
th2 = [-0.09 -0.5 -0.01];

[y,Fs] = audioread('input.wav');

count = 0;
for i = 1:(256*256)
    ycom = dct(y(i:i+255));
    for j=1:256
        if ((ycom(j) > th1(1))  || (ycom(j) <th2(1)))
            ycom(j) = 0;
            count = count+1;
        else
            ycom(j) = ycom(j);
        end
    end
    
    ydcom(i:i+255) = idct(ycom);
    i = i+256;
end
filename = "outputcompression.wav";
audiowrite(filename,ydcom,Fs);
sound(ydcom,Fs);
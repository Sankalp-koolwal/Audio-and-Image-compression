clc;
clear all;
close all;

[a,fs] = audioread('input.wav');

b = dct(a);
c = idct(b);
%sound(c,fs);
filename = "o1.wav";
audiowrite(filename,c,fs);

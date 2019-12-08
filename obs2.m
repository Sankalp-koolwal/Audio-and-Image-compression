clc;
clear all;
close all;

[a,fs] = audioread('input.wav');
b = myCompression(a,16384); %16384 gives 2 MB, actually N is 1262745
c = myDecompression(b,16384);
%sound(c,fs);
filename = "o2.wav";
audiowrite(filename,c,fs);
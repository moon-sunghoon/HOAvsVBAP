clear all; clc; 
addpath(genpath('E:\OneDrive - University of Derby\IES\coding'));
fs = 44100;

%% white noise

% wn = wgn(256, 1, 0);
% soundInput = wn;
 
%% pink noise
duration = 1.5;
pn = pinknoise(duration*fs);

hannwin = hann_window(220,220,duration*fs);
wpn = pn.*hannwin;
soundInput = wpn;
%% soundscape sample

%playingTime = 6*fs;
%startingTime = 3*fs;
%soundInput = audioread('ambisignals_hoa3.wav');
%soundInput = soundInput(startingTime:startingTime+playingTime,:);

%% Encoding/Decoding

Bmn = encodeHOA(3,soundInput,180,0); %encoding the original signal into ambisnoic signals

[phi,theta,L] = getLebedev(2); %virtual loudspeaker layout/lebedev grid

C = speakerSH(3, L); %spherical harmonics function for loudspeaker layout

Dh = decodeHOA(3, C,1); 
Dl = decodeHOA(3,C);
%g = Dh *Bmn.';

filtersignal = dualFilter(Bmn, 700, fs); %filter for dual-band, lowpass, highpass filter

gh= Dh *filtersignal(:,:,2).'; % low pass filter * basic decoding / high pass filter * maxre decoding
gl= Dl *filtersignal(:,:,1).';
g = gh+gl;
%% Binaural Rendering

output = binauralRenderer(g, phi,theta);
output = output/max(abs(output(:)));

%% save file
filename = '.wav';
audiowrite(filename,output,fs)
sound(output,fs)



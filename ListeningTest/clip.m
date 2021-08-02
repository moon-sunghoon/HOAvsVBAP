clear all; clc; 
fs= 44100;
playingTime1 = 6*fs;
startingTime1 = 3*fs;
soundInput1 = audioread('vbap_Martha.wav');
soundInput1 = soundInput1(startingTime1:startingTime1+playingTime1,:);

playingTime2 = 6*fs;
startingTime2 = 4*fs;
soundInput2 = audioread('stereo_Showcase.wav');
soundInput2 = soundInput2(startingTime2:startingTime2+playingTime2,:);

playingTime3 = 6*fs;
startingTime3 = 32*fs;
soundInput3 = audioread('stereo_Martha.wav');
soundInput3 = soundInput3(startingTime3:startingTime3+playingTime3,:);

playingTime4 = 6*fs;
startingTime4 = 34.5*fs;
soundInput4 = audioread('stereo_FootballStadium.wav');
soundInput4 = soundInput4(startingTime4:startingTime4+playingTime4,:);

filename1 = 'cliped_peepers.wav';
audiowrite(filename1,soundInput1,fs)

filename2 = 'cliped_showcase.wav';
audiowrite(filename2,soundInput2,fs)

filename3 = 'cliped_Martha.wav';
audiowrite(filename3,soundInput3,fs)

filename4 = 'cliped_football.wav';
audiowrite(filename4,soundInput4,fs)
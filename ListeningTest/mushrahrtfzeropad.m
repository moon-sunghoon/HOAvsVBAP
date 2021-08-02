
clear all; clc;
fs = 44100;
soundInput1 = audioread('mono_peepers.wav');
soundInput2 = audioread('mono_Martha.wav');
soundInput3 = audioread('mono_FootballStadium.wav');
soundInput4 = audioread('mono_Showcase.wav');
soundInput5 = audioread('stereo_peepers.wav');
soundInput6 = audioread('stereo_Martha.wav');
soundInput7 = audioread('stereo_FootballStadium.wav');
soundInput8 = audioread('stereo_Showcase.wav');

soundInput9 = audioread('beamformer_peepers.wav');
soundInput10= audioread('beamformer_Martha.wav');
soundInput11= audioread('beamformer_football.wav');
soundInput12 = audioread('beamformer_showcase.wav');
[phi,theta,L] = getLebedev(2);


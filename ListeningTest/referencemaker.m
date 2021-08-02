fs= 44100;
playingTime1 = 6*fs;
startingTime1 = 3*fs;
soundInput1 = audioread('beam_peepers.wav');
soundInput1 = soundInput1(startingTime1:startingTime1+playingTime1,:);

playingTime2 = 6*fs;
startingTime2 = 4*fs;
soundInput2 = audioread('beam_showcase.wav');
soundInput2 = soundInput2(startingTime2:startingTime2+playingTime2,:);

playingTime3 = 6*fs;
startingTime3 = 32*fs;
soundInput3 = audioread('beam_Martha.wav');
soundInput3 = soundInput3(startingTime3:startingTime3+playingTime3,:);

playingTime4 = 6*fs;
startingTime4 = 34.5*fs;
soundInput4 = audioread('beam_football.wav');
soundInput4 = soundInput4(startingTime4:startingTime4+playingTime4,:);

filename1 = 'beamformer_peepers.wav';
audiowrite(filename1,soundInput1,fs)

filename2 = 'beamformer_showcase.wav';
audiowrite(filename2,soundInput2,fs)

filename3 = 'beamformer_Martha.wav';
audiowrite(filename3,soundInput3,fs)

filename4 = 'beamformer_football.wav';
audiowrite(filename4,soundInput4,fs)

function dual_sig = dualFilter(sig, cutoffs,fs)
lSig = size(sig,1);
nCh = size(sig,2);
nBand = length(cutoffs)+1;
% order of fir filters
lFilt = 1024;
f =(0:lFilt)*fs/lFilt;
% zero pad
sig_pad = [sig; zeros(lFilt/2,nCh)];
sig_band = zeros([size(sig_pad) nBand]);


% create first and last lowpass and highpass in the filterbank
filters = zeros(lFilt+1, nBand);
filters(:,1) = fir1(lFilt, cutoffs(1)/(fs/2), 'low');
filters(:,nBand) = fir1(lFilt, cutoffs(nBand-1)/(fs/2), 'high');

%plotFilter1 = mag2db(abs(fft(filters(:,1))));
%plotFilter2 = mag2db(abs(fft(filters(:,2))));



%semilogx(f,plotFilter1,f,plotFilter2); grid on;
%xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');

if nBand > 2
    for i = 2:(nBand-1)
        filters(:,i) = fir1(lFilt, [cutoffs(i-1) cutoffs(i)]/(fs/2), 'bandpass');
    end
end

for i = 1:nBand
    sig_band(:,:,i) = fftfilt(filters(:,i), sig_pad);
end

dual_sig = sig_band(lFilt/2+1:end,:,:);

end
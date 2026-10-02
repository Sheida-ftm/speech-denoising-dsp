function samples = Fourier_Samples(Freq_vector , audio_vector , Fs)

audio_vector = audio_vector(:);
N = length(audio_vector);

t = (0:N-1)' / Fs;

sz_freq = size(Freq_vector);
freqs = Freq_vector(:);
M = length(freqs);
samples_flat = zeros(M, 1);
for m = 1:M
    samples_flat(m) = (1/Fs) * sum(audio_vector .* exp(-2i * pi * freqs(m) * t));
end

samples = reshape(samples_flat, sz_freq);

end
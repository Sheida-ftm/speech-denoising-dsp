function output_samples = voice_siren_separator(vector_of_samples, Fs)

x = vector_of_samples(:);
N = length(x);
X = fft(x);
freqs = (0:N-1)' * (Fs / N);
freqs_wrapped = freqs;
freqs_wrapped(freqs_wrapped > Fs/2) = Fs - freqs_wrapped(freqs_wrapped > Fs/2);

f_start = 500;
f_end   = 1700;

attenuation_factor = 0.05; 

filter = ones(size(freqs_wrapped));

inside_band = (freqs_wrapped >= f_start) & (freqs_wrapped <= f_end);
filter(inside_band) = attenuation_factor;
X_filtered = X .* filter;

output_samples = real(ifft(X_filtered));

end
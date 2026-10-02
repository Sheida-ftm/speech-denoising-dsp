function Z_samples = Ztrans_Samples(Z_Re_vec , Z_Im_vec , audio_vector)

% Z_samples = Ztrans_Samples(Z_Re_vec , Z_Im_vec , audio_vector)
%
% You need to write a function that evaluates the Fourier samples of a 
% "Continuous-Domain" signal at the frequencies given in "Freq_vector". 
% "audio_vector" encapsulates the samples of this continuous-domain signal 
% captured with the sampling rate "Fs". 
% In simple words, if x(t) and X(w) denote the continuous-domain signal and
% its Fourier transform, respectively, by knowing the samples 
%                              x[n] = x(n/Fs)
% we would like to obtain the values X(2*pi * ff), where ff stands for the
% elements in "Freq_vector".
%
% "Freq_vector" is a vector of frequency values in Hz at which the Fourier
% samples are desired.
%
% "audio_vector" is the vector of samples of an audio signal.
%
% "Fs" is the sampling frequency (HZ) which is used for sampling the audio 
% signal.


% this is a random code to make the function work. You need to replace it
% with proper lines.

Z_samples   = zeros(length(Z_Re_vec) , length(Z_Im_vec));

h       = waitbar(0 , 'Calculating the samples of the Z-transform ...');
for xx_ind = 1 : length(Z_Re_vec)
    xx_ind
    Z_Re    = Z_Re_vec(xx_ind);
    
%     for yy_ind = 1 : length(Z_Im_vec)
%         yy_ind
%         Z_Im    = Z_Im_vec(yy_ind);
%         
%         waitbar( (xx_ind * (length(Z_Im_vec) - 1) + yy_ind) / length(Z_Im_vec) / length(Z_Re_vec) );
%         
%         Z   = Z_Re + 1j * Z_Im;
%         
%         Z_samples(xx_ind , yy_ind)  = Z.^(-[0 : length(audio_vector)-1]) * audio_vector;
%         
%     end


    waitbar( xx_ind / length(Z_Re_vec) );

    zzz     = Z_Re + 1j * Z_Im_vec.';
    zpower  = ones(length(Z_Im_vec) , length(audio_vector));
    for aa = 2 : length(audio_vector)
        zpower(: , aa)  = zpower(: , aa-1) ./ zzz;
    end
    Z_samples(xx_ind , :)   = zpower * audio_vector;
    
end
close(h)
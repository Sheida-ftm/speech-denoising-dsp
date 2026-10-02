% This is the main file which should be run to produce the outputs. If this
% is your first time with MATLAB, either press F5 or click on the green
% triangle button (RUN).
%
% You do not need to change this file. To produce the requested results, 
% you need to edit the functions 
%               "Fourier_Samples.m" and "voice_siren_separator.m" 
% in "S&S MATLAB HW Package/Functions/"


% This part is to clear the command window, remove all the pre-defined
% parameters and close all open figures
clc
clear all
close all


% Adding the folder that contains our written functions to the list of 
% paths that MATLAB checks
addpath('Functions')


% the name and the location of the sopurce file
source_file     = './Audio Input/PoliceTalk_siren.wav';





%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reading the audio file
[audio_vector , Fs]     = audioread(source_file);     
                    % audio_vector: contains the samples of the audio signal
                    % Fs: sampling frequency in Hz

% converting Stereo to Mono (for the sake of simplicity, we remove one channel)
audio_vector    = audio_vector(: , 1);               


% playing the audio signal
disp('--- You now here the original audio file ---')
play_audio(audio_vector , Fs)
disp('---------------- End of file ---------------')
disp(' ')







%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the frequencies at which the Fourier transform is requested
Freq_vector     = linspace(-10e3 , 10e3 , 1e3+1);

% calling the function that evaluates the Fourier transform at given
% frequencies
audio_Fourier   = Fourier_Samples(Freq_vector , audio_vector , Fs);

% plotting the Fouerier transform of the source file
figure(1)
subplot(2,1,1)
plot(Freq_vector , abs(audio_Fourier))
ylabel('abs of Fourier')
title('Original Audio signal')
subplot(2,1,2)
plot(Freq_vector , phase(audio_Fourier))
ylabel('phase of Fourier')
xlabel('Frequency (Hz)')

% saving the figure
savefig('./Outputs/Source_Fourier.fig')










%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fitering the source to separate voice from the siren in background
separated_signal    = voice_siren_separator(audio_vector , Fs);

% playing the result
disp('--- You now here the processed audio file ---')
play_audio(separated_signal , Fs)
disp('---------------- End of file ----------------')
disp(' ')

% saving the processed audio signal
write_audio(separated_signal  ,  Fs , 'processed.wav')


% plotting the Fourier samples of the processed audio signal
separated_Fourier   = Fourier_Samples(Freq_vector , separated_signal , Fs);

figure(2)
subplot(2,1,1)
plot(Freq_vector , abs(separated_Fourier))
ylabel('abs of Fourier')
title('Processed Audio signal (voice separated from siren)')
subplot(2,1,2)
plot(Freq_vector , phase(separated_Fourier))
ylabel('phase of Fourier')
xlabel('Frequency (Hz)')

% saving the figure
savefig('./Outputs/Processed_Fourier.fig')

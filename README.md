# speech-denoising-dsp
MATLAB implementation of frequency-domain speech enhancement by removing police siren interference using Fourier analysis and digital filtering.
## Overview

This project implements a digital signal processing pipeline for removing police siren interference from a speech recording using frequency-selective filtering in MATLAB.

The objective is to suppress the siren while preserving the intelligibility and quality of the speech signal as much as possible. The implementation relies on Fourier analysis to identify the spectral components of the mixed signal and applies a carefully designed filter to attenuate the siren frequencies.

This project was completed as part of the *Signals and Systems* course.

---

## Features

- Fourier transform implementation for sampled signals
- Frequency spectrum analysis
- Frequency-selective filter design
- Speech enhancement through frequency-domain processing
- Audio reconstruction and evaluation
- MATLAB implementation

---

## Methodology

The processing pipeline is summarized below:

```text
Input Audio
      │
      ▼
Fourier Transform
      │
      ▼
Frequency Spectrum Analysis
      │
      ▼
Filter Design
      │
      ▼
Frequency-Domain Filtering
      │
      ▼
Inverse Transform
      │
      ▼
Enhanced Speech Output
```

The filter was designed to significantly reduce the siren while minimizing distortion of the speech signal, balancing noise suppression and speech quality.

---

## Repository Structure

```text
.
├── Functions/
│   ├── Samples_Fourier.m
│   └── separator_siren_voice.m
├── InputAudio/
├── Outputs/
├── main.m
├── Report.pdf
└── README.md
```

---

## Results

The implemented algorithm successfully attenuates the dominant siren frequencies and improves the clarity of the speech recording.

The accompanying report discusses the filter design process, implementation details, and the trade-offs between siren suppression and speech distortion.

---

## Technologies

- MATLAB
- Digital Signal Processing (DSP)
- Fourier Transform
- Frequency-Domain Filtering
- Signal Analysis

---

## Skills Demonstrated

- Digital signal processing
- Fourier analysis
- Filter design
- MATLAB programming
- Audio signal enhancement
- Frequency-domain analysis

---

## Future Improvements

Possible extensions include:

- Adaptive filtering techniques
- Wiener filtering
- Spectral subtraction methods
- Automatic detection of interference frequencies
- Quantitative evaluation using objective speech quality metrics

---

## Author

**Sheida Fatemizadeh**

Electrical Engineering Student  
Sharif University of Technology

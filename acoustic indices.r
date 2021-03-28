###############################################################################
### CALCULATION OF THE MOST USED ECOACOUSTICS INDEXES
### Author: Mario M Rollo Jr
### Biosciences Institute, Coastal Campus, Sao Paulo State University, Brazil
### March 26, 2021
###############################################################################
#
#
# Load the libraries containing the most used ecoacoustic indices
library(tuneR)
library(seewave)
library(soundecology)
# Read the sound file and convert into a R object
soundfile <- readWave(file = "2017_02_07_23_50_29.wav") # where x is an wave audio file; keep double quotes in place and substitute the file by your own
# Create the spectrogram without drawing it on screen
soundfile.spectrogram <- spectro(soundfile, wl = 1024, ovlp = 50, plot = FALSE) 
# Calculate first ACI according to Pieretti et al. 2011
soundfile.aci <- acoustic_complexity(soundfile) # ACI 
ACI <- soundfile.aci$AciTotAll_left
# Calculate NDSI according to Kasten et al. 2012
ACI
soundfile.ndsi <- ndsi(soundfile) #NDSI
NDSI <- soundfile.ndsi$ndsi_left
NDSI
# Calculate Bioacoustic Index according to Boelman et al. 2007
soundfile.bioindex <- bioacoustic_index(soundfile) #Bioacoustic Index
BIO_INDEX <- soundfile.bioindex$left_area
BIO_INDEX
# Calculate Acoustic Diversity Index (ADI) according to Villanueva-Rivera et al. 2011
soundfile.adi <- acoustic_diversity(soundfile) # ADI
ADI <- soundfile.adi$adi_left
ADI
# Calculate Acoustic Evennes Index (AEI)
soundfile.aei <- acoustic_evenness(soundfile) # AEI
AEI <- soundfile.aei$aei_left
AEI
# Calculate Temporal Entropy (TH)
TH <- th(env(soundfile, plot=FALSE))
TH
# Calculate Spectral Entropy (SH)
SH <- sh(spec(soundfile))
SH
indices <- data.frame(ACI, NDSI, BIO_INDEX, ADI, AEI, TH, SH)
write.csv2(indices, 'indices2.csv', row.names = FALSE)


This file explains all of the variables in each of the datasets that accompany: 
	Keefer ML, Clabough TS, Jepson MA, Johnson EL, Peery CA, Caudill CC

dataset: RDST_fish_summaries.xlxs
SPP 	= species (ASH = steelhead, FA= fall Chinooks salmon, SP = spring Chinook salmon, SU = summer Chinook salmon)
year 	= year
RDST 	= RDST code
chan	= radio frequency
code	= radio code
tagdate	= date fish was tagged
julian	= day of year fish was tagged
WQM T on tagdate = Columbia River water temperature on the date fish was tagged
PIT 	= code for where fish were PIT tagged as juveniles or adults (BONAFF)
Fate	= code for where fish were last detected as adults (columns K and L provide additional details)
fatereach = section of Columbia / Snake River where adult was last detected
reaches	= number of river reaches that fish had complete RDST temperature data
rand	= random number to select fish for figures

Reaches 1-8	= summary data for the full study reach
n	= number of RDST records
ttp	= time to pass (days)
T mean	= mean fish temperature
T std	= standard deviation of fish temperature
T max	= maximum fish temperature
T min	= minimum fish temperature
max-min	= difference betwen maximum and minimum temperatures
DD	= degree days above 0 C
n >=20	= number of records where temperatures was >=20 C
DD T20	= degree days above 20 C
  
Reach 1, Reach 2, Reach 3, Reach 4, Reach 5, Reach 6, Reach 7, Reach 8	
n	= number of RDST records
ttp	= time to pass (days)
T mean	= mean fish temperature
T std	= standard deviation of fish temperature
T max	= maximum fish temperature
T min	= minimum fish temperature
max-min	= difference betwen maximum and minimum temperatures
DD	= degree days above 0 C

warmest 
T max 	= warmest temperature maximum fish encountered
reach 	= reach where warmest temperature maximum occurred
T mean	= warmest temperature mean fish encountered
reach 	= reach where warmest temperature mean occurred

coldest 
T min	= coldest temperature minimum fish encountered
reach 	= reach where warmest temperature minimum occurred
T mean	= coldest temperature mean fish encountered
reach 	= reach where coldest temperature mean occurred

dataset: RDST_data_2000.csv
SPP	= species (Steelhead, Fall Chinook, Spring Chinook, Summer Chinook)
date	= date
time	= time
DST	= RDST code
depth	= fish depth (m)
temperature = fish body temperature (C)
record	= record number on 30-min intervals (1 = midnight, 1-May)
PIT	= code for where fish were PIT tagged as juveniles or adults (BONAFF)
Fate	= code for where fish were last detected as adults (columns K and L provide additional details)
reach	= section of Columbia / Snake River
origin	= all fish from the Snake River (SNRfish)

dataset: RDST_data_2002.csv 
SPP	= species (Steelhead, Fall Chinook, Spring Chinook, Summer Chinook)
date	= date
time	= time
DST	= RDST code
depth	= fish depth (m)
temperature = fish body temperature (C)
record	= record number on 30-min intervals (1 = midnight, 1-May)
PIT	= code for where fish were PIT tagged as juveniles or adults (BONAFF)
Fate	= code for where fish were last detected as adults (columns K and L provide additional details)
reach	= section of Columbia / Snake River
origin	= all fish from the Snake River (SNRfish)

dataset: WQM_water_temperature_data.csv  
	available water temperature data (deg C) from the Water Quality Monitoring sites at 8 USACE dams 
	original data source: http://www.cbr.washington.edu/dart/
		Data from all 8 dams in 2000 and 2002
		Data from Bonneville Dam, 1996-2015



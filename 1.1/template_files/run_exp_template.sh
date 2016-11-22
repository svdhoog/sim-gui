#!/bin/bash
####################################################
# This script is automatically generated by the GUI.
# It is for setting up and running the experiment:
# Steps:
# - 1 : experiment settings
# - 2 : creation of experiment folder hierarchy
# - 3 : creation of the specific settings xml file
# - 4 : creation of a job list
# - 5 : launching the job list
# - 6 : start plotting routines using R
	################################################################################################################


#Set the base folder
export BASE='<SimulationSettings.WORKING_DIRECTORY>'




#0.xml file
export ZERO_XML_FILE='<SimulationSettings.ZERO_XML_FILE>'
#Export the database folder for R scripts
export DATABASE_LOCATION='<SimulationSettings.WORKING_DIRECTORY>'


#Iterations
export ITS=<SimulationSettings.numIterations>


#Set number of nodes to use (only valid for parallel)
export NR_NODES=1


#Set number of job processes to use (nr of job lists: job_list_$n.sh)
export NUM_PROCS=<SimulationSettings.numProcessors>


#Set the number of parameters to vary
export NUM_PARS=<NUM_PARS>


#Set number of batch runs
export TOTAL_RUNS=<SimulationSettings.numBatchRuns>
export RUNS=$(seq 1 $TOTAL_RUNS)
echo 'Batch runs:[' $RUNS ']'


#Executables
export MAIN_S='<SimulationSettings.MAIN_EXECUTABLE>'


#Location of the model XML (used to generate the SQL)
export MODEL_XML_FILE='<MODEL_XML_FILE>'


#Location of R scripts
#Parallel
export PATH_R_SCRIPTS='<SimulationSettings.PATH_TO_RSCRIPTS>'


#Running simulations
export DO_RUN=<SimulationSettings.DO_RUN>
export CREATE_SQL=1


#Compress the database, keeping the original .db file. If a pre-existing compressed file exists, overwrite and recreate it.
export DO_COMPRESS_KEEP_ORIGINAL=<SimulationSettings.DO_COMPRESS_KEEP_ORIGINAL>


#Compress the database, remove the original .db file. If a pre-existing compressed file exists, overwrite and recreate it.
export DO_COMPRESS_REMOVE_ORIGINAL=<SimulationSettings.DO_COMPRESS_REMOVE_ORIGINAL>


#Decompress the SQL database without removing the original compressed file
export DO_DECOMPRESS=<SimulationSettings.DO_DECOMPRESS>


#Remove the decompressed files
export DO_REMOVE_DB=<SimulationSettings.DO_REMOVE_DB>


echo 'Starting top-level experiment script...'


######### STEP 1: EXPERIMENT SETTINGS ##################################################################
. set_exp.sh


######### STEP 2: CREATION OF EXPERIMENT FOLDER HIERARCHY 
bash ./exp_script_1_setup.sh


######### STEP 3: CREATION OF THE SPECIFIC SETTINGS XML FILE 
bash ./exp_script_2_specific.sh


######### STEP 4: CREATING  JOB SCRIPTS 
bash ./create_job_list.sh


######### STEP 5: LAUNCHING  JOB SCRIPTS 
bash ./launch_job_list.sh


wait
######### STEP 6: R scripts for plotting data
# Parallel R
<RUN_R_SCRIPTS>


wait
######### STEP 7: Compress dara bases
bash ./create_job_list_compress.sh


bash ./launch_job_list.sh


echo 'Finished top-level experiment script.'



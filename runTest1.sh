#!/bin/bash
#
#Script used to perform functional tests on network distance tool
#
#Author: M. Chazalviel & E. CAMENEN
#
#Copyright: PhenoMeNal/INRA Toulouse 2018

#Settings files
OUTFILE1="matrix.txt"
OUTFILE2="reactionsPath.txt"

SBML="data/recon2.v03_ext_noCompartment_noTransport.xml"
AAM="data/recon2.v03_ext_noCompartment_noTransport_C-AAM-weights.tab"
FINGERPRINT="data/fingerprintHE.txt"

testFileExist(){
    [ ! -f $OUTFILE1 ] && {
        echo "$OUTFILE1 does not exist"
        BOOLEAN_ERR="true"
    }
    [ ! -f $OUTFILE2 ] && {
        echo "$OUTFILE2 does not exist"
        BOOLEAN_ERR="true"
    }
}

getElapsedTime(){
    local END_TIME=$(date -u -d $(date +"%H:%M:%S") +"%s")
    local ELAPSED_TIME=$(date -u -d "0 $END_TIME sec - $1 sec" +"%H:%M:%S")
    echo "Time to run the process ${ELAPSED_TIME:0:2}h ${ELAPSED_TIME:3:2}min ${ELAPSED_TIME:6:2}s"
}

########### MAIN ###########

START_TIME=$(date -u -d $(date +"%H:%M:%S") +"%s")
printf "Tests in progress, could take a minute...\n"
java -jar fingerprintSubnetwork.jar -algo ShortestAsUndirected -network ${SBML}  -fingerprint ${FINGERPRINT} -atommapping ${AAM} -matrixresult ${OUTFILE1} -reactionresult ${OUTFILE2}

testFileExist

getElapsedTime ${START_TIME}
[[ -z ${BOOLEAN_ERR} ]] || exit 1
exit 0
#!/bin/bash

#./cov.sh ~/Desktop/24h_openssl_vanilla 5 /home/enso/Desktop/K-Scheduler/afl_integration/test_programs/openssl/openssl_afl_asan @@

OUT_DIR=$1
ROUND=$2
TARGET=$3

if [ ! -d "$OUT_DIR/data" ]; then mkdir "$OUT_DIR/data" ;fi


for((i=1;i<=$ROUND;++i))
do 
    #echo $(expr $i \* 3 + 1);
    if [ -d "$OUT_DIR/data/$i" ];then rm -rf $OUT_DIR/data/$i;fi 
    ../afl-showmap -i $OUT_DIR/output_$i/queue -o $OUT_DIR/data/$i -q -s -S 0 -m none -- $TARGET;
done

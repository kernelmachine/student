#!/bin/bash



gpu=$1
src_lang=$2
tgt_lang=$3
epochs=$4
num_topics=$5
output=$6

CUDA_VISIBLE_DEVICES=$gpu python run_student.py $HOME/rcv2_data/$src_lang/ train -d $HOME/rcv2_data/$tgt_lang/dev -k $num_topics -o output/$output -t $HOME/rcv2_data/$tgt_lang/test -e $epochs --labels topics
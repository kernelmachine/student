#!/bin/bash                                        

lang=$1                                            
lg=$2                                              
labeled_sample_size=$3                             
unlabeled_sample_size=$4                           
src_file=$5                                        

cd ..                                              
head -n $unlabeled_sample_size $src_file > "$src_file".sample                                         
python -m src.util.rcv2 --sample_labeled $labeled_sample_size --lang $lang --lg $lg --force --unlabeled "$src_file".sample                                                                               
cd student                                         
./run.sh 1 $lang $lang 100 50 $lang/semisupervised_"$labeled_sample_size"_"$unlabeled_sample_size" ~/data/MUSE/multi/wiki.multi."$lg".vec
./coherence.sh $lang/semisupervised_"$labeled_sample_size"_"$unlabeled_sample_size" $lang > output/$lang/semisupervised_"$labeled_sample_size"_"$unlabeled_sample_size"/coherence.txt                       


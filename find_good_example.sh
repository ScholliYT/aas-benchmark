#!/bin/bash


best_improvemenet=1

for i in {3..5}
do
    echo "Pattern length" $i
    for j in {0..10}
    do
        rnd=$(cat /dev/urandom | tr -dc 'GCAT' | fold -w $i | head -n 1)
        output=$(./target/release/aas-benchmark wbm,wmbm,wtbm -n 1 --tf gcat1.txt --pa $rnd)
        rgx='BM Read count: ([0-9]+).*Mem BM Read count: ([0-9]+).*Turbo BM Read count: ([0-9]+)'
        # BM Read count: 10144803 Mem BM Read count: 9044796 Turbo BM Read count: 9044796
        if [[ $output =~ $rgx ]]
        then
            bmcount=${BASH_REMATCH[1]}
            tbmcount=${BASH_REMATCH[3]}
            improvement=$(bc -l <<< $tbmcount/$bmcount)

            echo $rnd "difference" $(expr $bmcount - $tbmcount) "runtime fraction" $improvement


            # if (( $(echo "$improvement < $best_improvemenet" |bc -l) ))
            # then
            #     echo $rnd "difference" $(expr $bmcount - $tbmcount) "runtime fraction" $improvement
            #     best_improvemenet=$improvement
            # fi
        else
            echo "you fucked up!"
        fi
    done
done

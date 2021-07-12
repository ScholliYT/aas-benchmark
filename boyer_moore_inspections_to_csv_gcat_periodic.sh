#!/bin/bash

echo "algorithm,pattern_length,inspections" > "data/gcat_periodic_alphbabet_inspections_length_2_to_10.csv"

declare -a PatternArray=(
  "TT" "CC" "GG" "AA" "AAA" "GGG" "CCC" "CACA" "TTTT" "CGCG" "GAGA" "GCGC" "GTGT" "CCCC" "GGGG" "ATAT" "AGAG" "TATA" "CTCT" "ATATA" "CCCCC" "TTTTT" "TCTCT" "ACACA" "CACAC" "CTCTC" "TATAT" "TGTGT" "CGCGC" "GCGCG" "AAAAA" "GTGTG" "AGAGA" "GGGGG" "GTAGTA" "GAAGAA" "CGACGA" "CGCGCG" "ACAACA" "GGAGGA" "GGTGGT" "CGGCGG" "GACGAC" "GTGTGT" "CAGCAG" "CTACTA" "TATTAT" "CACCAC" "TATATA" "GTGGTG" "ACACAC" "TCTCTC" "CTCCTC" "GCCGCC" "TGGTGGT" "TGTTGTT" "CTCTCTC" "TACTACT" "CACCACC" "AACAACA" "GAAGAAG" "TCATCAT" "AATAATA" "AGCAGCA" "TATTATT" "TATATAT" "CTCCTCC" "TGTGTGT" "CCGCCGC" "AAAAAAA" "AGAGAGA" "CTACTAC" "ATTATTA" "CGTCGTC" "CCCCCCCC" "CCCACCCA" "GTGCGTGC" "AGTCAGTC" "CCAGCCAG" "TCGTCGTC" "GAGTGAGT" "TGAATGAA" "AATAAATA" "AGAGAGAG" "CCTACCTA" "AAGAAAGA" "TATATATA" "ACCACCAC" "TGCGTGCG" "CACCCACC" "CCATCCAT" "ATGATGAT" "GAATGAAT" "TTCATTCA" "CGCCCGCCC" "CTTCCTTCC" "CAGACAGAC" "TCATTCATT" "AACCAACCA" "GGGCGGGCG" "GATAGATAG" "AAAAAAAAA" "TCTTTCTTT" "TGGTGGTGG" "CGCACGCAC" "GATCGATCG" "AGTTAGTTA" "ACCCACCCA" "AGCAAGCAA" "GCGTGCGTG" "GTACGTACG" "GACTGACTG" "TCAGTCAGT" "CTGCCTGCC" "AATATAATAT" "ACGTACGTAC" "CCCCTCCCCT" "GCCATGCCAT" "CGATCCGATC" "CTATTCTATT" "ATGAATGAAT" "CTAGACTAGA" "GTAATGTAAT" "TCTAGTCTAG" "AGCTCAGCTC" "CCAGACCAGA" "TTTCCTTTCC" "CCATCCATCC" "TATAATATAA" "TCCTTTCCTT" "CGGCGCGGCG" "AGTTAGTTAG" "CCTGGCCTGG" "GGTCCGGTCC"
)

for pattern in "${PatternArray[@]}"
do
    echo "Pattern: " $pattern

    output=$(./target/release/aas-benchmark wbm,wmbm,wtbm -n 1 --tf datasets/gcat_text_1e7.txt --noheader --pa $pattern)
    rgx='BM Read count: ([0-9]+).*Mem BM Read count: ([0-9]+).*Turbo BM Read count: ([0-9]+)'

    if [[ $output =~ $rgx ]]
    then
        bmcount=${BASH_REMATCH[1]}
        mbmcount=${BASH_REMATCH[2]}
        tbmcount=${BASH_REMATCH[3]}

        plen=${#pattern}
        echo "Weak Boyer Moore,$plen,$bmcount" >> "data/gcat_periodic_alphbabet_inspections_length_2_to_10.csv"
        echo "Weak Memorizing Boyer Moore,$plen,$mbmcount" >> "data/gcat_periodic_alphbabet_inspections_length_2_to_10.csv"
        echo "Weak Turbo Boyer Moore,$plen,$tbmcount" >> "data/gcat_periodic_alphbabet_inspections_length_2_to_10.csv"
    else
        echo "you fucked up!"
    fi
done


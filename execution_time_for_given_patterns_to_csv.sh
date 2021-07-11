#!/bin/bash


echo "algorithm,text_length,pattern_length,execution,matches,prep_time_ms,time_ms" > "data/binary_alphbabet_length_2_to_8.csv"

declare -a PatternArray=("00" "01" "10" "11" "000" "001" "010" "011" "100" "101" "110" "111" "0000" "0001" "0010" "0011" "0100" "0101" "0110" "0111" "1000" "1001" "1010" "1011" "1100" "1101" "1110" "1111" "00000" "00001" "00010" "00011" "00100" "00101" "00110" "00111" "01000" "01001" "01010" "01011" "01100" "01101" "01110" "01111" "10000" "10001" "10010" "10011" "10100" "10101" "10110" "10111" "11000" "11001" "11010" "11011" "11100" "11101" "11110" "11111" "000000" "000001" "000010" "000011" "000100" "000101" "000110" "000111" "001000" "001001" "001010" "001011" "001100" "001101" "001110" "001111" "010000" "010001" "010010" "010011" "010100" "010101" "010110" "010111" "011000" "011001" "011010" "011011" "011100" "011101" "011110" "011111" "100000" "100001" "100010" "100011" "100100" "100101" "100110" "100111" "101000" "101001" "101010" "101011" "101100" "101101" "101110" "101111" "110000" "110001" "110010" "110011" "110100" "110101" "110110" "110111" "111000" "111001" "111010" "111011" "111100" "111101" "111110" "111111" "0000000" "0000001" "0000010" "0000011" "0000100" "0000101" "0000110" "0000111" "0001000" "0001001" "0001010" "0001011" "0001100" "0001101" "0001110" "0001111" "0010000" "0010001" "0010010" "0010011" "0010100" "0010101" "0010110" "0010111" "0011000" "0011001" "0011010" "0011011" "0011100" "0011101" "0011110" "0011111" "0100000" "0100001" "0100010" "0100011" "0100100" "0100101" "0100110" "0100111" "0101000" "0101001" "0101010" "0101011" "0101100" "0101101" "0101110" "0101111" "0110000" "0110001" "0110010" "0110011" "0110100" "0110101" "0110110" "0110111" "0111000" "0111001" "0111010" "0111011" "0111100" "0111101" "0111110" "0111111" "1000000" "1000001" "1000010" "1000011" "1000100" "1000101" "1000110" "1000111" "1001000" "1001001" "1001010" "1001011" "1001100" "1001101" "1001110" "1001111" "1010000" "1010001" "1010010" "1010011" "1010100" "1010101" "1010110" "1010111" "1011000" "1011001" "1011010" "1011011" "1011100" "1011101" "1011110" "1011111" "1100000" "1100001" "1100010" "1100011" "1100100" "1100101" "1100110" "1100111" "1101000" "1101001" "1101010" "1101011" "1101100" "1101101" "1101110" "1101111" "1110000" "1110001" "1110010" "1110011" "1110100" "1110101" "1110110" "1110111" "1111000" "1111001" "1111010" "1111011" "1111100" "1111101" "1111110" "1111111")

for pattern in "${PatternArray[@]}"
do
    echo "Pattern: " $pattern

    output=$(./target/release/aas-benchmark wbm,wmbm,wtbm,naive,kmp,horspool,shift-and -n 10 --tf binary_text_100e6.txt --noheader --pa $pattern)
    echo "$output" >> "data/binary_alphbabet_length_2_to_8.csv"
done

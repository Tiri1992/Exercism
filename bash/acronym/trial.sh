#!/usr/local/bin/bash

read -a myarr

for i in "${myarr[@]}"
do 
    echo "$i"
done
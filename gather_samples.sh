#!/bin/bash

output_file="strudel.json"

rm $output_file

echo "{"_base":"https://raw.githubusercontent.com/georgie-png/ST_breaks/main/"," >> pandoc_order.md

for file in ./*/*.wav
do
  if [[ "$file" != "./${output_file}" ]]
    then

        xbase=${file##*/}
        xpref=${xbase%.*}
        name=${xpref%%-*}

        echo "'${name}':['${file}']," >> ${output_file}
  fi
 


done

echo "}" >> $output_file
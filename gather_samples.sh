#!/bin/bash

output_file="strudel.json"

rm $output_file

jsonData="{\"_base\":\"https://raw.githubusercontent.com/georgie-png/ST_breaks/main/\"" >> $output_file

for file in ./*/*.wav
do
  if [[ "$file" != "./${output_file}" ]]
    then
        echo "${jsonData}," >> ${output_file}

        xbase=${file##*/}
        xpref=${xbase%.*}
        name=${xpref%%-*}
        path=${file#"./"}

        jsonData="\"${name}\":[\"${path}\"]"
  fi
 
done

echo $jsonData >> ${output_file}
echo "}" >> $output_file
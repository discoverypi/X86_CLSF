#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
  sed -i 's/\/toolsx\/bin\/perl/\/usr\/bin\/perl/g' $line
  sed -i 's/\/toolsx\/bin\/m4/\/usr\/bin\/m4/g' $line
  sed -i 's/\/toolsx\/bin\/bash/\/usr\/bin\/bash/g' $line
  sed -i 's/\/toolsx\/bin\/python/\/usr\/bin\/python/g' $line
  sed -i 's/\/toolsx\/bin\/sed/\/usr\/bin\/sed/g' $line
  sed -i 's/\/toolsx\/bin\/tail/\/usr\/bin\/tail/g' $line
  sed -i 's/\/toolsx\/bin\/xmllint/\/usr\/bin\/xmllint/g' $line
  sed -i 's/\/toolsx\/bin\/sort/\/usr\/bin\/sort/g' $line
  sed -i 's/\/toolsx\/bin\/gawk/\/usr\/bin\/gawk/g' $line
  sed -i 's/\/toolsx\/bin\/grep/\/bin\/grep/g' $line
  sed -i 's/\/toolsx\/bin\/cp/\/bin\/cp/g' $line

done < "$1"


#!/bin/bash

error_prefix="\033[41m"
error_close="\033[m"
data="$1"
message=""

for one_thing in ${data}
do 
  grep -iq ^${one_thing}$  /usr/share/dict/words
  if [ `echo $?` -eq 0 ]
  then 
    message="${message}${one_thing} "
  else message="${message}${error_prefix}${one_thing}${error_close} "
 fi 
done

echo -e $message

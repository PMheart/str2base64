#!/bin/bash

clear

#
# Script (str2base64.sh) to convert a string to base64 data in a way that it can be
# used for properties as text <"desired text"> instead of <646573697265642074657874>
#
#
# Version 1.1 - Copyright (c) 2013-2016 by Pike R. Alpha
# Note: This is PMheart's fork version! i.e. This is NOT an offical version of str2base64.sh.
#

while true
  do
    #
    # Get input from user.
    #
    read -p "Enter string to convert: " string
    #
    # Convert to postscript format.
    #
    data=$(echo -n "${string}"|xxd -ps|tr -d '\n')
    #
    # Add "00" to the data and convert it to base64 data.
    #
    output=$(echo -n "${data}00"|xxd -r -p|base64)

    #
    # Want to exit? Or just convert 'exit' to base64?
    #
    if [[ "${string}" == "exit" ]];
      then
        read -p "You mean exiting (1) or convert 'exit' to base64 (2) ? (1/2) " todo
        case "${todo}" in
            1 )
                #
                # Exiting...
                #
                break
            ;;
            * )
                #
                # Print the base64 format of 'exit'. (ZXhpdAA=)
                #
                echo 'ZXhpdAA='
                #
                # Continue running the script.
                #
                continue
            ;;
        esac
    fi

    #
    # Print the result after converting.
    #
    echo "${output}"

  done

exit 0

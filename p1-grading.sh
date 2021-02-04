#!/bin/sh
ERR_MSG_CLONE="No config defined. Use [org] command first to set GitHub organization name. See help."
ERR_MSG_WRONG_FORMAT="Wrong command format. See help."
SUCCESS_MSG_ORG="Organization has been set as"

command=$1
param=$2

if [ $command = "--help" ]
then
    echo "Tool for cloning Hacktiv8 Phase 1 repositories."
    echo "Usages:"
    echo "  > org <GitHub organization name> | example: org rmt-09-istanbul-fox"
    echo "  > clone <weekday> | example: clone w1d1"
fi

if [ $command = "--org" ]
then
    if [ ! -z $param ]
    then
        if [ ! -f .config ]
        then
            touch .config
        fi
        echo ${param} > .config
        echo "${SUCCESS_MSG_ORG} ${param}"
    else
        echo $ERR_MSG_WRONG_FORMAT
    fi
fi

if [ $command = "--clone" ]
then
    if [ ! -z $param ]
    then
        if [ ! -s .config ]
        then
            echo $ERR_MSG_CLONE
        else
            org=`cat .config`
            rm -rf "submissions/$param-${org}"
            mkdir -p "submissions/$param-${org}"
            cd "submissions/$param-${org}"
            if [ $param = "w1d1" ]
            then
                git clone "git@github.com:${org}/problem-solving.git"
                git clone "git@github.com:${org}/broken-palindrome-swapper.git"
                git clone "git@github.com:${org}/susun-kursi.git"
                git clone "git@github.com:${org}/money-coins.git"
            fi
            if [ $param = "w1d2" ]
            then
                git clone "git@github.com:${org}/roman-numerals-recursive.git"
                git clone "git@github.com:${org}/numbers-in-words.git"
                git clone "git@github.com:${org}/linear-search.git"
                git clone "git@github.com:${org}/selection-sort.git"
                git clone "git@github.com:${org}/binary-search.git"
                git clone "git@github.com:${org}/dictionary-sort.git"
            fi
            if [ $param = "w1d3" ]
            then
                git clone "git@github.com:${org}/jsracer.git"
                git clone "git@github.com:${org}/check-vowels-in-array.git"
            fi
        fi
    else
        echo $ERR_MSG_WRONG_FORMAT
    fi
fi

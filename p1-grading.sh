#!/bin/sh
ERR_MSG_NO_CONFIG="No config defined. Use [org] command first to set GitHub organization name. See help."
ERR_MSG_WRONG_FORMAT="Wrong command format. See help."
SUCCESS_MSG_ORG="Organization has been set as"
GIT_GITHUB="git@github.com"

command=$1
param=$2

if [ $command = "help" ]
then
    echo "Tool for cloning Hacktiv8 Phase 1 repositories."
    echo "Usages:"
    echo "  > org <GitHub organization name> | example: ./p1-grading.sh org rmt-09-istanbul-fox"
    echo "  > conf                           | example: ./p1-grading.sh conf"
    echo "  > clone <weekday>                | example: ./p1-grading.sh clone w1d1"
fi

if [ $command = "conf" ]
then
    if [ ! -s .config ]
    then
        echo $ERR_MSG_NO_CONFIG
    else
        echo `cat .config`
    fi
fi

if [ $command = "org" ]
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

if [ $command = "clone" ]
then
    if [ ! -z $param ]
    then
        if [ ! -s .config ]
        then
            echo $ERR_MSG_NO_CONFIG
        else
            org=`cat .config`
            rm -rf "submissions/$param-${org}"
            mkdir -p "submissions/$param-${org}"
            cd "submissions/$param-${org}"
            if [ $param = "w1d1" ]
            then
                git clone "${GIT_GITHUB}:${org}/problem-solving.git"
                git clone "${GIT_GITHUB}:${org}/broken-palindrome-swapper.git"
                git clone "${GIT_GITHUB}:${org}/susun-kursi.git"
                git clone "${GIT_GITHUB}:${org}/money-coins.git"
            fi
            if [ $param = "w1d2" ]
            then
                git clone "${GIT_GITHUB}:${org}/roman-numerals-recursive.git"
                git clone "${GIT_GITHUB}:${org}/numbers-in-words.git"
                git clone "${GIT_GITHUB}:${org}/linear-search.git"
                git clone "${GIT_GITHUB}:${org}/selection-sort.git"
                git clone "${GIT_GITHUB}:${org}/binary-search.git"
                git clone "${GIT_GITHUB}:${org}/dictionary-sort.git"
            fi
            if [ $param = "w1d3" ]
            then
                git clone "${GIT_GITHUB}:${org}/jsracer.git"
                git clone "${GIT_GITHUB}:${org}/check-vowels-in-array.git"
            fi
            if [ $param = "w1d4" ]
            then
                git clone "${GIT_GITHUB}:${org}/advanced-calculator.git"
                git clone "${GIT_GITHUB}:${org}/parsing-data.git"
                git clone "${GIT_GITHUB}:${org}/mango-tree.git"
            fi
            if [ $param = "w1d5" ]
            then
                git clone "${GIT_GITHUB}:${org}/tree-grove.git"
                git clone "${GIT_GITHUB}:${org}/cookies-and-ovens.git"
            fi
        fi
    else
        echo $ERR_MSG_WRONG_FORMAT
    fi
fi

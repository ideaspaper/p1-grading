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
        echo "${SUCCESS_MSG_ORG} \"${param}\""
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
            if [ $param = "w2d1" ]
            then
                git clone "${GIT_GITHUB}:${org}/object-composition.git"
            fi
            if [ $param = "w2d2" ]
            then
                git clone "${GIT_GITHUB}:${org}/callback-belanja.git"
                git clone "${GIT_GITHUB}:${org}/callback-countdown.git"
                git clone "${GIT_GITHUB}:${org}/callback-multiple-file.git"
                git clone "${GIT_GITHUB}:${org}/js-todos.git"
            fi
            if [ $param = "w2d3" ]
            then
                git clone "${GIT_GITHUB}:${org}/sistem-rumahsehat-sederhana.git"
            fi
            if [ $param = "w2d4" ]
            then
                git clone "${GIT_GITHUB}:${org}/all-relations-case-study.git"
                git clone "${GIT_GITHUB}:${org}/schema-address-book.git"
                git clone "${GIT_GITHUB}:${org}/schema-simple-e-commerce.git"
                git clone "${GIT_GITHUB}:${org}/schema-poll-db.git"
            fi
            if [ $param = "w2d5" ]
            then
                git clone "${GIT_GITHUB}:${org}/poll-db.git"
                git clone "${GIT_GITHUB}:${org}/school-application-weekend.git"
            fi
            if [ $param = "w3d1" ]
            then
                git clone "${GIT_GITHUB}:${org}/school-application-express.git"
            fi
            if [ $param = "w3d2" ]
            then
                git clone "${GIT_GITHUB}:${org}/school-application-mvc.git"
            fi
            if [ $param = "w3d3" ]
            then
                git clone "${GIT_GITHUB}:${org}/school-application-refactor.git"
            fi
            if [ $param = "w3d4" ]
            then
                git clone "${GIT_GITHUB}:${org}/promise-belanja.git"
                git clone "${GIT_GITHUB}:${org}/promise-multiple-file.git"
                git clone "${GIT_GITHUB}:${org}/school-application-promise.git"
            fi
            if [ $param = "w3d5" ]
            then
                git clone "${GIT_GITHUB}:${org}/school-application-sequelize.git"
            fi
            if [ $param = "w4d1" ]
            then
                git clone "${GIT_GITHUB}:${org}/movies-app.git"
            fi
        fi
    else
        echo $ERR_MSG_WRONG_FORMAT
    fi
fi

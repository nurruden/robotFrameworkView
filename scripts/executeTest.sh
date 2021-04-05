#!/bin/sh -xe
while [[ $# > 0 ]]; do
    key="$1"
    case $key in
        --suite)
        suite="$2"
        #echo $pcsIp
        shift # past argument
        ;;
         --testTag)
        testTag="$2"
        #echo $robot_ip
        shift # past argument
        ;;
         --testCaseName)
        testCaseName="$2"
        #echo $robot_ip
        shift # past argument
        ;;
    esac
    shift # past argument or value
done


TSTROOT=`pwd`
echo $TSTROOT


#clear old data then copy over new test code

if [ -z "$testCaseName" ]; then
    echo "testCaseName is empty, skip single case model"
fi

if [ -z "$testTag" ]; then
    echo "testTag is empty, skip single tag mode"
fi


if [ -n "$testTag" ] && [ -z "$testCaseName" ]; then
#if we have test tag and no test case
cd ${TSTROOT} ; ./run.sh -L DEBUG  --include ${testTag} ${suite}  || true

fi

if [ -z "$testTag" ] && [ -n "$testCaseName" ]; then
#if we have no test tag, bu have  test case
cd ${TSTROOT} ; ./run.sh -L DEBUG -t ${testCaseName}  ${suite}  || true
fi

if [ -n "$testTag" ] && [ -n "$testCaseName" ]; then
#if we have test tag and  test case
cd ${TSTROOT} ; ./run.sh -L DEBUG -t ${testCaseName}  --include ${testTag} ${suite}  || true
fi

if [ -z "$testTag" ] && [ -z "$testCaseName" ]; then
#if we have one of test tag and test case
cd ${TSTROOT} ; ./run.sh -d ./results/gc -L DEBUG official || true
#after rerun merge test

fi



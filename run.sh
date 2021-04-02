#!/bin/sh
if (echo $0 | grep -q -e '^/') ;then
 full_prog=$0;
else
 full_prog=`pwd`/$0
fi

#progName=`basename ${full_prog}`
#scriptPath=`dirname ${full_prog}`
#export PATH=${scriptPath}/support:${PATH}
##export PATH=/opt/northstar/thirdparty/python/bin/:${scriptPath}/support:${PATH}
#export PYTHONPATH=${PYTHONPATH}:${scriptPath}/lib:${scriptPath}/../../tools/ns-emu/src/python/
##export PYTHONPATH=${PYTHONPATH}:/Users/allanyang/Documents/new_ns_git/bj_automation_ns/northstar-tests/regression-tests/robot/lib
##run test
robot  $*
#mv log.html  original_log.html || true
#mv report.html  original_report.html || true
##clean up
#ps -aux|grep chrome |grep -v grep|cut -c 9-15|xargs kill -9 || true
#sleep 10
##rerun
#pybot  --rerunfailed output.xml --output rerun.xml $*
##merge report
#mv output.xml original.xml  || true
#rebot --output output.xml --merge original.xml rerun.xml  || true
#
#if [ -f "output.xml" ]
#then
#	echo "output.xml found."
#else
#	echo "output.xml not found, all case pass in one runw"
#	mv original.xml output.xml  || true
#	mv original_log.html  log.html || true
#	mv original_report.html  report.html || true
#fi
#mv output.xml without_build_info_output.xml
##rebot -D  `cat build.url` -M rpm:`cat build.url`  --output output.xml   without_build_info_output.xml
#rebot  --output output.xml   without_build_info_output.xml
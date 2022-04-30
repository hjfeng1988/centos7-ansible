#!/bin/bash
java_home=`ps -ef |grep java |grep -v jmxclient|grep -v grep |awk '{print $20}' |cut -d / -f 4`
java_no=`ps -ef |grep java |grep -v jmxclient|grep -v grep |awk '{print $20}' |cut -d / -f 4 |wc -l`
i=1
#local_ip=`ifconfig eth0 |awk '(NR==2){print $2}'`
printf '{"data":[\n'
for java in $java_home
do
        java_server=`echo $java |awk -F"." '{print $1}'`
        n_port=`ps -ef |grep java |grep $java |grep -v grep |awk '{print $14}' |cut -d = -f 2`
        if [ $i != $java_no ];then
                printf "\t\t{ \n"
                printf "\t\t\t\"{#JMX_PORT}\":\"${n_port}\",\n"
                printf "\t\t\t\"{#JAVA_NAME}\":\"${java_server}\"},\n"
        else
                printf "\t\t{ \n"
                printf "\t\t\t\"{#JMX_PORT}\":\"${n_port}\",\n"
                printf "\t\t\t\"{#JAVA_NAME}\":\"${java_server}\"}\n"
        fi
let "i=i+1"
done
printf "\t]\n"
printf "}\n"

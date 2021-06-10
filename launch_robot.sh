#!/bin/bash

echo "Robot: $1"

port=10001
host=$2

ifconfig

if [ $1 == 1 ] 
then
    port=10001
elif [ $1 == 2 ]
then
    port=10002
elif [ $1 == 3 ]
then 
    port=10003
elif [ $1 == 4 ]
then
    port=10004
else
   echo "None of the condition met"
fi

source /opt/ros/foxy/setup.sh
source /home/ichiro/ros2-ws/install/local_setup.sh

echo "Launching robot $1 in host $host and port $port, please wait!"
ros2 run aruku walking_main $host $port /home/ichiro/ros2-ws/configuration/walking/

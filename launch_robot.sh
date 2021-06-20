#!/bin/bash

ROBOT_ID=${ROBOCUP_ROBOT_ID:=1}

TEAM_COLOR=${ROBOCUP_TEAM_COLOR:="blue"}

ADDR=${ROBOCUP_SIMULATOR_ADDR:=127.0.0.1:10001}
IP=$(cut -d: -f1 <(echo $ADDR))
PORT=$(cut -d: -f2 <(echo $ADDR))

PATH=${ICONFIG_PATH:="/home/ichiro/configuration/"}
echo "Playing Robot $ROBOT_ID"

source /opt/ros/foxy/setup.sh
source /home/ichiro/soccer/install/local_setup.sh

echo "Launching robot $ROBOT_ID in IP $IP and port $PORT, please wait!"

while true; do
    ros2 run soccer robocup_soccer_run $IP $PORT /home/ichiro/configuration/ $ROBOT_ID 
    sleep 1
done



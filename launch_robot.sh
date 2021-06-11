#!/usr/bin/env bash

cd /home/ichiro/ros2s-ws

ROBOT_ID=${ROBOCUP_ROBOT_ID:=1}

TEAM_COLOR=${ROBOCUP_TEAM_COLOR:="blue"}

ADDR=${ROBOCUP_SIMULATOR_ADDR:=127.0.0.1:10001}
IP=$(cut -d: -f1 <(echo $ADDR))
PORT=$(cut -d: -f2 <(echo $ADDR))

PATH=${ICONFIG_PATH:="/home/ichiro/ros2-ws/configuration/walking/"}
PKG=${IPKG:="aruku"}
EXC=${IEXC:="walking_main"}
echo "Robot: $ROBOT_ID"

source /opt/ros/foxy/setup.sh
source /home/ichiro/ros2-ws/install/local_setup.sh

echo "Launching robot $ROBOT_ID in IP $IP and port $PORT, please wait!"

while true; do
    ros2 run $PKG $EXC $IP $PORT $PATH 
    sleep 1
done



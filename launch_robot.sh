#!/usr/bin/env bash

ROBOT_ID=${ROBOCUP_ROBOT_ID:=1}

TEAM_COLOR=${ROBOCUP_TEAM_COLOR:="blue"}

ADDR=${ROBOCUP_SIMULATOR_ADDR:=127.0.0.1:10001}
IP=$(cut -d: -f1 <(echo $ADDR))
PORT=$(cut -d: -f2 <(echo $ADDR))
TEAMMIRRORIP=${ROBOCUP_MIRROR_SERVER_IP:=127.0.0.1}
TEAMMIRRORPORT=3737

export USER=ichiro
echo "Playing Robot $ROBOT_ID"

source /opt/ros/foxy/setup.sh
source /home/ichiro/ros2-ws/install/setup.sh

echo "Launching robot $ROBOT_ID in IP $IP and port $PORT, please wait!"

while true; do
    ros2 run soccer robocup_soccer_run $IP $PORT /home/ichiro/configuration/ $ROBOT_ID $ROBOCUP_MIRROR_SERVER_IP
    sleep 1
done



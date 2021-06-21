FROM ros:foxy-ros-base

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get update && apt-get install -y curl git nano

RUN curl -s http://repository.ichiro-its.org/debian/setup-nightly.bash | bash -s
RUN curl -s http://repository.ichiro-its.org/rosdep/setup.bash | bash -s

WORKDIR /home/ichiro

COPY . /home/ichiro/soccer

RUN git clone https://github.com/ichiro-its/configuration.git

WORKDIR /home/ichiro/soccer

RUN apt-get update
RUN rosdep update && rosdep install -y --from-paths .

RUN . /opt/ros/foxy/setup.sh \
    && colcon build 

RUN useradd ichiro
RUN groupadd docker
RUN usermod -aG docker ichiro


RUN mv /home/ichiro/configuration/launch_robot.sh /home/ichiro/launch_robot.sh 
RUN chmod +x /home/ichiro/launch_robot.sh
USER ichiro
RUN export USER=ichiro

ENTRYPOINT ["/home/ichiro/launch_robot.sh"]

CMD ["-eROBOCUP_SIMULATOR_ADDR=127.0.0.1:10001", "-eROBOCUP_ROBOT_ID=1"]
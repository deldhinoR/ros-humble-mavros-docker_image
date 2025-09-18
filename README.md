# ros-humble-mavros-docker_image
Features

ROS 2 Humble Desktop installed

MAVROS and MAVROS extras (ros-humble-mavros, ros-humble-mavros-extras)

GeographicLib datasets installed (required by MAVROS)

Non-root ubuntu user (UID/GID 1000) for safer container usage

Workspace directory: /home/ubuntu/ros2_ws

ROS environment automatically sourced

#USAGE
docker pull ghcr.io/deldhinor/ros2-humble-mavros:latest
#Run the Container
docker run -it --rm ghcr.io/deldhinor/ros2-humble-mavros:latest

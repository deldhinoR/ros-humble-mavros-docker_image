FROM osrf/ros:humble-desktop

# Ensure ROS Humble base is installed (redundant but explicit)
RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    python3-colcon-common-extensions \
    build-essential \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install MAVROS + extras
RUN apt-get update && apt-get install -y \
    ros-humble-mavros \
    ros-humble-mavros-extras \
    && rm -rf /var/lib/apt/lists/*

# Install GeographicLib datasets (ROS 2 MAVROS requirement)
RUN wget https://raw.githubusercontent.com/mavlink/mavros/ros2/mavros/scripts/install_geographiclib_datasets.sh -O /tmp/install_geographiclib_datasets.sh \
    && chmod +x /tmp/install_geographiclib_datasets.sh \
    && /tmp/install_geographiclib_datasets.sh \
    && rm /tmp/install_geographiclib_datasets.sh

# Create non-root ubuntu user (matches host UID/GID = 1000)
RUN groupadd -g 1000 ubuntu && \
    useradd -m -u 1000 -g 1000 ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ubuntu
WORKDIR /home/ubuntu/ros2_ws

# Auto source ROS environment
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && exec \"$@\"", "--"]


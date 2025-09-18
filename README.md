# ROS 2 Humble + MAVROS Docker Image

A ready-to-use **ROS 2 Humble Desktop** Docker image with **MAVROS** and all required dependencies installed. Designed for drone simulation and MAVLink-compatible projects.

---

## Features

- ROS 2 Humble Desktop installed  
- MAVROS and MAVROS extras (`ros-humble-mavros`, `ros-humble-mavros-extras`)  
- GeographicLib datasets installed (required by MAVROS)  
- Non-root `ubuntu` user (UID/GID 1000) for safer container usage  
- Workspace directory: `/home/ubuntu/ros2_ws`  
- ROS environment automatically sourced  

---

## Usage

### Pull the image

```bash
docker pull ghcr.io/deldhinor/ros2-humble-mavros:latest

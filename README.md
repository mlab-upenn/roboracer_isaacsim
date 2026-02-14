# roboracer_isaacsim

For best performance, use the following Rendering Settings(top-right corner in IsaacSim GUI):
- DLSS
    - Enable NVIDIA DLSS FPS Multiplier(2x-4x) 
    - Set Mode to `Performance`

Set the camera to `Camera -> DroneCamera` to see the roboracer in aerial view.

## Docker Setup (Source Build)

This setup builds the environment based on Ubuntu 22.04 with ROS2 Humble.
It clones the NVIDIA Isaac Sim 6.0 repository and builds it inside the Docker image. 
To use 5.1 version, update the Dockerfile and remove `-b develop` when cloning the Isaac Sim repository.

### 1. Build Docker Image

This step compiles the Docker image and builds Isaac Sim from source (this takes time).

```bash
./docker/build.sh
```

### 2. Run Container

Once built, launch the container:

```bash
./docker/run.sh
```
This script handles GPU access, X11 forwarding, and host networking.

### 3. Run Isaac Sim

Inside the container:

```bash
cd /root/isaacsim/_build/linux-x86_64/release
./isaac-sim.sh
```

ROS 2 Humble is installed and sourced automatically.
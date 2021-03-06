# CloudCtl | Lifecycle Services Pod
CloudCtl is a short-lived "Lifecycle Services Pod" delivery framework designed to meet the needs of zero pre-existing infrastucture deployment or augment cloud native features for "bring your own service" scenarios. It provides a dynamic container-based infrastructure service as code standard for consistent and reliable deployment, lifecycle, and outage rescue + postmortem operations tasks. It is designed to spawn from rudimentary Konductor plugin automation and is capable of dynamically hosting additional containerized services as needed. CloudCtl pod is fully capable of meeting any and all service delivery needs to deliver a cold datacenter "first heart beat" deployment with no prerequisites other than Podman installed on a single supported linux host and the minimum viable Koffer artifact bundles.

Features:
  - Supported on CoreOS or any Podman capable distribution
  - Pre-startup SHA256 verification of artifact bundles 
  - High side Konductor orchestrated services including:
    - Konductor Dev & Ops Runtime
    - Tftpd Service for PXE support
    - ISC-DHCP Service for PXE support
    - Haproxy for LoadBalancer services
    - Nginx for serving CoreOS Ignition files
    - CoreDNS for "bring your own DNS" support
    - Docker Registry:2 for serving pre-hydrated image content

## Instructions:
### 1. Run Infrastructure Collector with Koffer Engine
```
mkdir -p ${HOME}/bundle;\
podman run -it --rm --pull always \
    --volume ${HOME}/bundle:/root/bundle:z \
  quay.io/cloudctl/koffer:latest bundle --silent \
    --config https://git.io/JkBYS
```
### 2. Example, check size of bundle
```
du -sh ~/bundle/koffer-bundle.tpdk-cloudctl.tar.xz
``` 
### 3. Push bundle to disconnected node
  - Example
```
 rsync --progress -avzh bundle -e "ssh -i ~/.ssh/id_rsa" core@$10.11.12.261:~ 
```
### 4. SSH or login to disconnected host with bundle
### 5. Extract bundle to /root/
```
 sudo tar -xvf ${HOME}/bundle/koffer-bundle.tpdk-cloudctl.tar.xz -C /root
``` 
### 6. Extract bundle to /root/
```
 sudo -i
 cd /root/cloudctl
``` 
### 7. Resume normal cloudctl startup @ [Step: 2]
[Step: 2]:https://github.com/CloudCtl/CloudCtl#2-initialize-cloudctl-pod

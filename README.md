# Docker LEDE
This is a LEDE image build environment, include some software for Chinese users.

## How to use
```shell
docker run -ti --name=lede -v lede-bin:/home/lede/lede/bin acrisliu/lede
```
Then you can use `make menuconfig && make` to build your own LEDE images.

For Netgear R6100, you can use this docker image: https://github.com/Acris/docker-lede

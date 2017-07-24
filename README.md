# Docker LEDE
This is a LEDE image build environment, include some software for Chinese users.

## How to use
Start with `make menuconfig`:
```shell
docker run -ti --name=lede -v lede-bin:/home/lede/lede/bin acrisliu/lede make menuconfig && make
```

Or just use the bash shell:

```shell
docker run -ti --name=lede -v lede-bin:/home/lede/lede/bin acrisliu/lede
```

---

For Netgear R6100, you can use this docker image: https://github.com/Acris/docker-lede-netgear-r6100

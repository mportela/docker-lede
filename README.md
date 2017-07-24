# Docker LEDE
This is a LEDE image build environment, include some software for Chinese users.

Current LEDE version: v17.01.2

## How to use
Start with bash shell:
```shell
docker run -ti --name=lede -v /path/to/binary:/home/lede/lede/bin acrisliu/lede
```

Then you can configure your LEDE image:
- run `make menuconfig` and set target;
- run `make defconfig` to set default config for build system and device;
- run `make menuconfig` and modify set of package;

and run `make` command to build it.


You can also build your docker image with external configuration file:

```
FROM acrisliu/lede
COPY .config /home/lede/lede
CMD ["make"]
```

---

For Netgear R6100, you can use this docker image: https://github.com/Acris/docker-lede-netgear-r6100

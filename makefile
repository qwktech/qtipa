FCOSDISK=/dev/sdb

STREAM=stable
TEMP=/tmp/Rpi5boot

.PHONY: build clean install

build:
	podman run --rm -it \
	  --security-opt label=disable \
	  -v ${PWD}/build:${TEMP}:Z \
	  -v ${PWD}/bin:/data:Z \
	  quay.io/fedora/fedora:40 \
	  /data/build-deps.sh

clean:
	rm -r build/*

install: build
	sudo podman run --rm -it \
	  --pull=always \
	  --privileged \
	  -v /dev:/dev \
	  -v /run/udev:/run/udev \
	  -v ${PWD}/bin:/data:Z \
	  quay.io/coreos/coreos-installer:release \
	  install ${FCOSDISK} -i /data/qtipa.ign
	sudo ${PWD}/bin/install-bootloader.sh ${FCOSDISK}


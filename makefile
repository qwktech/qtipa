DATADIR=/srv/qtipa/data
UNITPATH=
IMAGE=quay.io/freeipa/freeipa-server:rocky-9
IP=10.102.100.7
HOSTNAME=qtipa1-container.qwktech.local

install:
	podman run -it --read-only \
	  -n qtipa1-installer \
	  -h ${HOSTNAME} \
	  -ip ${IP} \
	  -v ${DATADIR}:/data:Z \
	  ${IMAGE} \
	  ipa-server-install -r QWKTECH.LOCAL --no-ntp
	ln -s quadlet/* ${UNITPATH}


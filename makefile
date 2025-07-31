DATADIR=/srv/qtipa/data
UNITDIR=/etc/containers/systemd/
IMAGE=quay.io/freeipa/freeipa-server:rocky-9

HOSTIP=192.168.4.7
HOSTHOSTNAME=qtipa1.qwktech.local

CONTAINERIP=10.102.100.7
CONTAINERHOSTNAME=qtipa1-container.qwktech.local


install:
	sudo echo "${HOSTIP}    ${HOSTHOSTNAME}" > /etc/hosts
	sudo echo "$${CONTAINERIP}    ${CONTAINERHOSTNAME}" >> /etc/hosts
	sudo podman run -it --read-only \
	  -n qtipa1-installer \
	  -h ${CONTAINERHOSTNAME} \
	  -ip ${CONTAINERIP} \
	  -v ${DATADIR}:/data:Z \
	  ${IMAGE} \
	  ipa-server-install -r QWKTECH.LOCAL --no-ntp
	sudo ln -s quadlet/* ${UNITDIR}
	sudo systemctl daemon-reload
	sudo systemctl enable --now freeipa.container

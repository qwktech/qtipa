install:
	podman run -it --read-only \
	  -n qtipa1-container \
	  -h qtipa1-container.qwktech.local \
	  -ip 10.102.100.7 \
	  -v /srv/qtipa/data:/data:Z \
	  quay.io/freeipa/freeipa-server:rocky-9 \
	  ipa-server-install -r QWKTECH.LOCAL --no-ntp



# QTIPA Dev Blog: Day 2

A few months later I decided to pick this up again. Some things have changed
for the better (I hope) and should be easier to keep on track (I hope).


## Getting up to speed

* Fedora 42 came out without offical Pi5 support, and I don't want to continue
  down the rabbit hole of 3rd party kernels on FedoraCoreOS.
* RHEL 10 came out, which means Rocky 10 came out.
* Rocky 10 has offical support for Pi5 out of the box.


## Containers

I offically decided to use podman containers in Rocky 10 to host the IPA
server and keep maintanance to a minimum. I updated the git file to run the
base config command and used AI to convert the command to a quadlet file. This
file symlinked to the `/etc/containers/systemd/` directory.

I havent tested shit.

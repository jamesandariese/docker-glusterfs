FROM fedora:30

MAINTAINER James Andariese <james@strudelline.net>

RUN dnf install -y glusterfs-6.2-1.fc30 glusterfs-server glusterfs-coreutils patch && dnf clean all && rm -rf /var/cache/dnf/*

RUN cp -a /etc/glusterfs{,.orig}

ADD mount.glusterfs-docker.patch /tmp
ADD start.sh /

RUN cp -a /sbin/mount.glusterfs /sbin/mount.glusterfs-docker && patch /sbin/mount.glusterfs-docker /tmp/mount.glusterfs-docker.patch

ENTRYPOINT ["/start.sh"]


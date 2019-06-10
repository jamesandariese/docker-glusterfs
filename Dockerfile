FROM fedora:30

RUN dnf install -y glusterfs-6.2-1.fc30 glusterfs-server glusterfs-coreutils

RUN cp -a /etc/glusterfs{,.orig}

ADD start.sh /

ENTRYPOINT ["/start.sh"]


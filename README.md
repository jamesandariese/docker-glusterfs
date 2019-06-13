# docker-glusterfs
gluster in a container.  or giac?

### Installation

Install the systemd units and run the following:

```
systemctl enable glusterd
systemctl start glusterd
```

### Joining a cluster

If you already have a node or more operational, you will want to join this node as a peer.
Run the following on an existing node.

```
docker exec -ti glusterd gluster peer probe <hostname-or-ip-of-new-node>
```

### Creating a volume

To create a volume create your bricks in /srv/gluster/bricks/brickN/brick and
run the following on any joined node (my example is called `absol` and the volume is named `gvol0`):

```
docker exec -ti glusterd gluster volume create gvol0 absol:/srv/gluster/bricks/brick1/brick absol:/srv/gluster/brick2/brick
docker exec -ti glusterd gluster volume start gvol0
```

### Mount a volume

To mount a volume, create files like `example/mnt-gvol.*` in `/etc/systemd/system`.

You will also need to add the `mount.glusterfs-docker` command to `/sbin`:

```
docker run -i jamesandariese/glusterfs:6.2 cat /sbin/mount.glusterfs-docker > /sbin/mount.glusterfs-docker
chmod +x /sbin/mount.glusterfs-docker
```

In the example, `volumeName` would be `gvol0` and it will be mounted at `/mnt/gvol0`.

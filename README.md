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

To mount a volume, run the following:

```
systemctl enable glusterfs@volumeName
systemctl start glusterfs@volumeName
```

In the above example of creating a volume, `volumeName` would be `gvol0`.  This will mount `volumeName` at `/mnt/volumeName`.

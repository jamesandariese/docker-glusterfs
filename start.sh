#!/bin/bash
set -e

cp -an /etc/glusterfs.orig/* /etc/glusterfs/

exec "$@"

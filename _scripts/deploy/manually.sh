#! /bin/bash
# This script uses rsync to manually deploy the built site to pyrite so that
# this site build will be served from `http://design.cs.iastate.edu`. It is
# expected to be invoked from the root of the repository once the site has been
# built.

remote_user="$1"
local_src="_site/"
remote_host="pyrite.cs.iastate.edu"
remote_dest="/auto/web-home/other/design/WWW/"

if [ -z "$remote_user" ]; then
    echo "A remote user name must be supplied as an argument."
    exit
fi

if [ ! -d "$local_src" ]; then
    echo "The local build directory doesn't seem to exist: " $local_src
    exit
fi

#--chmod refuses to remove x for the owner.
# This is meant to be invoked from the root of the repository.
rsync --recursive --delete --progress \
      --perms --chmod=Du+rwx,Dg+rws,Do+rx,Fug+rw,Fo+r,Fugo-x \
      ${local_src} "${remote_user}@${remote_host}:${remote_dest}"

#!/bin/bash

# This file must be executable to work! chmod 755!

nfsopts="rw,nosuid,nodev,hard,intr,rsize=8192,wsize=8192"


for P in /bin /sbin /usr/bin /usr/sbin
do
	for M in showmount kshowmount
	do
		if [ -x $P/$M ]
		then
			SMNT=$P/$M
			break 2
		fi
	done
done

[ -x $SMNT ] || exit 1

function genEntry() {
  local server="$1"

  case "$server" in
  	"nucras" )
  		nfstype="nfs4"
  		;;
  	*)
  		nfstype="nfs"
  		;;
  esac
  local opts="-fstype=$nfstype,$nfsopts"


  local SHOWMOUNT="$SMNT --no-headers -e $key"

  if [ -z "$2" ]; then
      # this is only a very, very simple version. if you want something
      # more advanced, have a look at auto.net
      $SHOWMOUNT $server | awk "NR==1{ printf \"%s %s %s:%s\n\", \"$server\", \"$opts\", \"$server\", \$1}"
  else
     echo "$server $opts $server:$2"
  fi
}

echo "# auto-generated using $0"
genEntry mirr-srv1
genEntry mirr-srv2
genEntry nucras

for i in $(seq 1 99); do
   genEntry dema$i /localdisks
done

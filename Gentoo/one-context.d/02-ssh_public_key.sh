#!/bin/bash

[ -z "${SSH_PUBLIC_KEY}${EC2_PUBLIC_KEY}" ] && exit 0

mkdir -m0700 -p /root/.ssh

echo -n '' > /root/.ssh/authorized_keys

if [ -n "$SSH_PUBLIC_KEY" ]; then
    echo "$SSH_PUBLIC_KEY" >> /root/.ssh/authorized_keys
fi

if [ -n "$EC2_PUBLIC_KEY" ]; then
    echo "$EC2_PUBLIC_KEY" >> /root/.ssh/authorized_keys
fi

chmod 600 /root/.ssh/authorized_keys
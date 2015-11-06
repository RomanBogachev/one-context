#!/bin/bash
echo root:$ROOT_PASSWORD | /usr/sbin/chpasswd
mkdir -p ~/.ssh
echo $SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Force change password for root on 1st login
chage -d 0 root

# Remove directories
one_dir=/etc/one-context.d

rm -rf $one_dir

# self remove
rm $0
# and the entire directory
rmdir `dirname $0`

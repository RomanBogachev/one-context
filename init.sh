#!/bin/bash
one_dir=/etc/one-context.d

yum clean all && logrotate -f /etc/logrotate.conf && rm -rf /var/tmp/* && rm -f /etc/ssh/ssh_host_dsa_key && rm -f /etc/ssh/ssh_host_dsa_key.pub && rm -f /etc/ssh/ssh_host_rsa_key && rm -f /etc/ssh/ssh_host_rsa_key.pub && rm -f /etc/ssh/ssh_host_key && rm -f /etc/ssh/ssh_host_key.pub && cat /dev/null > /var/log/anaconda.ifcfg.log && cat /dev/null > /var/log/anaconda.program.log && cat /dev/null > /var/log/anaconda.storage.log && cat /dev/null > /var/log/anaconda.syslog && cat /dev/null > /var/log/anaconda.xlog && cat /dev/null > /var/log/anaconda.yum.log && cat /dev/null > /var/log/boot.log && cat /dev/null > /var/log/btmp && rm -f /var/log/btmp-* && cat /dev/null > /var/log/cron && rm -f /var/log/cron-* && cat /dev/null > /var/log/dmesg && cat /dev/null > /var/log/dracut.log && rm -f /var/log/dracut.log-* && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/maillog && rm -f /var/log/maillog-* && cat /dev/null > /var/log/messages && rm -f /var/log/messages-* && cat /dev/null > /var/log/secure && rm -f /var/log/secure-* && cat /dev/null > /var/log/spooler && rm -f /var/log/spooler-* && cat /dev/null > /var/log/tallylog && cat /dev/null > /var/log/wtmp && rm -f /var/log/wtmp-* && cat /dev/null > /var/log/yum.log && rm -f /var/log/yum.log-* && cat /dev/null > /var/log/audit/audit.log && cat /dev/null > /var/log/anaconda.log

echo root:$ROOT_PASSWORD | /usr/sbin/chpasswd
mkdir -p ~/.ssh
echo $SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
restorecon -R -v /root/.ssh

# Force change password for root on 1st login
chage -d 0 root

rm -rf $one_dir
rm -f /etc/rc.d/init.d/vmcontext

# self remove
rm $0
# and the entire directory
rmdir `dirname $0`

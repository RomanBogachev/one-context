#!/bin/bash

one_dir=/etc/one-context.d ## CentOS one dir

# Check if Ubuntu or Debian
if [ -f /etc/os-release ];  then 
	DIST=`cat /etc/os-release | grep '^NAME=' | sed "s/^NAME=//" | sed "s/'//g;s/\"//g"` # Get distributive name
	VER=`cat /etc/os-release | grep '^VERSION_ID=' | sed "s/^VERSION_ID=//" | sed "s/'//g;s/\"//g"` # Get distributive version

	# Ubuntu
	if [[ $DIST=="Ubuntu" ]]; then

		# Ubuntu version 14.04
		if [[ $VER=="14.04" ]]; then

			# Clean logs and etc
			apt-get autoclean && apt-get autoremove && cat /dev/null > /var/log/alternatives.log && cat /dev/null > /var/log/auth.log && cat /dev/null > /var/log/boot.log && cat /dev/null > /var/log/bootstrap.log && cat /dev/null > /var/log/btmp && rm -f /var/log/dmesg.0 && rm -f /var/log/dmesg.1.gz && cat /dev/null > /var/log/dpkg.log && cat /dev/null > /var/log/faillog && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && cat /dev/null > /var/log/wtmp && rm -f /var/log/apt/* && rm -f /var/log/fsck/* && rm -f /var/log/installer/* && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/landscape/sysinfo.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && rm -f /var/log/unattended-upgrades && rm -f /var/log/upstart/* && rm -rf /var/tmp/* && rm -f /etc/ssh/ssh_host_dsa_key && rm -f /etc/ssh/ssh_host_dsa_key.pub && rm -f /etc/ssh/ssh_host_rsa_key && rm -f /etc/ssh/ssh_host_rsa_key.pub && rm -f /etc/ssh/ssh_host_key && rm -f /etc/ssh/ssh_host_key.pub && rm -f /etc/ssh/ssh_host_ed25519_key && rm -f /etc/ssh/ssh_host_ed25519_key.pub && history -cw

			cat /dev/null > /etc/apt/sources.list
			echo "deb http://mirror.yandex.ru/ubuntu/ trusty main multiverse restricted universe" > /etc/apt/sources.list
			echo "deb-src http://mirror.yandex.ru/ubuntu/ trusty main multiverse restricted universe" >> /etc/apt/sources.list

			# Enable remote root login via password
			sed -i '/PermitRootLogin/s/without-password/yes/g' /etc/ssh/sshd_config

			# Setup root password and RSA key via user inputs
			echo root:$ROOT_PASSWORD | /usr/sbin/chpasswd
			mkdir -p ~/.ssh
			echo $SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
			chmod 600 ~/.ssh/authorized_keys
			restorecon -R -v /root/.ssh

			# Force change password for root on 1st login
			chage -d 0 root

			# Remove one`s dirs
			rm -rf $one_dir
			rm -f /etc/init.d/vmcontext

			# self remove
			rm $0
			# and the entire directory
			rmdir `dirname $0`

		elif [[ $VER=="15.10" ]]; then

			# Clean logs and etc
			apt-get autoclean && apt-get autoremove && cat /dev/null > /var/log/alternatives.log && cat /dev/null > /var/log/auth.log && cat /dev/null > /var/log/boot.log && cat /dev/null > /var/log/bootstrap.log && cat /dev/null > /var/log/btmp && rm -f /var/log/dmesg.0 && rm -f /var/log/dmesg.1.gz && cat /dev/null > /var/log/dpkg.log && cat /dev/null > /var/log/faillog && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && cat /dev/null > /var/log/wtmp && rm -f /var/log/apt/* && rm -f /var/log/fsck/* && rm -f /var/log/installer/* && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/landscape/sysinfo.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && rm -f /var/log/unattended-upgrades && rm -f /var/log/upstart/* && rm -rf /var/tmp/* && rm -f /etc/ssh/ssh_host_dsa_key && rm -f /etc/ssh/ssh_host_dsa_key.pub && rm -f /etc/ssh/ssh_host_rsa_key && rm -f /etc/ssh/ssh_host_rsa_key.pub && rm -f /etc/ssh/ssh_host_key && rm -f /etc/ssh/ssh_host_key.pub && rm -f /etc/ssh/ssh_host_ed25519_key && rm -f /etc/ssh/ssh_host_ed25519_key.pub && history -cw

			cat /dev/null > /etc/apt/sources.list
			echo "deb http://mirror.yandex.ru/ubuntu/ wily main multiverse restricted universe" > /etc/apt/sources.list
			echo "deb-src http://mirror.yandex.ru/ubuntu/ wily main multiverse restricted universe" >> /etc/apt/sources.list

			# Enable remote root login via password
			sed -i '/PermitRootLogin/s/without-password/yes/g' /etc/ssh/sshd_config

			# Setup root password and RSA key via user inputs
			echo root:$ROOT_PASSWORD | /usr/sbin/chpasswd
			mkdir -p ~/.ssh
			echo $SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
			chmod 600 ~/.ssh/authorized_keys
			restorecon -R -v /root/.ssh

			# Force change password for root on 1st login
			chage -d 0 root

			# Remove one`s dirs
			rm -rf $one_dir
			rm -f /etc/init.d/vmcontext

			# self remove
			rm $0
			# and the entire directory
			rmdir `dirname $0`
		fi


	elif [[ $DIST=="Debian GNU/Linux" ]]; then

	# Clean logs and etc
	apt-get autoclean && apt-get autoremove && cat /dev/null > /var/log/alternatives.log && cat /dev/null > /var/log/auth.log && cat /dev/null > /var/log/boot.log && cat /dev/null > /var/log/bootstrap.log && cat /dev/null > /var/log/btmp && rm -f /var/log/dmesg.0 && rm -f /var/log/dmesg.1.gz && cat /dev/null > /var/log/dpkg.log && cat /dev/null > /var/log/faillog && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && cat /dev/null > /var/log/wtmp && rm -f /var/log/apt/* && rm -f /var/log/fsck/* && rm -f /var/log/installer/* && cat /dev/null > /var/log/kern.log && cat /dev/null > /var/log/landscape/sysinfo.log && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/syslog && cat /dev/null > /var/log/udev && rm -f /var/log/unattended-upgrades && rm -f /var/log/upstart/* && rm -rf /var/tmp/* && rm -f /etc/ssh/ssh_host_dsa_key && rm -f /etc/ssh/ssh_host_dsa_key.pub && rm -f /etc/ssh/ssh_host_rsa_key && rm -f /etc/ssh/ssh_host_rsa_key.pub && rm -f /etc/ssh/ssh_host_key && rm -f /etc/ssh/ssh_host_key.pub && rm -f /etc/ssh/ssh_host_ed25519_key && rm -f /etc/ssh/ssh_host_ed25519_key.pub && history -cw
	
	cat /dev/null > /etc/apt/sources.list
	echo "deb http://mirror.yandex.ru/debian jessie main" > /etc/apt/sources.list
	echo "deb-src http://mirror.yandex.ru/debian jessie main" >> /etc/apt/sources.list
	echo "deb http://mirror.yandex.ru/debian jessie-updates main" >> /etc/apt/sources.list
	echo "deb-src http://mirror.yandex.ru/debian jessie-updates main" >> /etc/apt/sources.list

	# Enable remote root login via password
	sed -i '/PermitRootLogin/s/without-password/yes/g' /etc/ssh/sshd_config

	# Setup root password and RSA key via user inputs
	echo root:$ROOT_PASSWORD | /usr/sbin/chpasswd
	mkdir -p ~/.ssh
	echo $SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
	chmod 600 ~/.ssh/authorized_keys
	restorecon -R -v /root/.ssh

	# Force change password for root on 1st login
	chage -d 0 root

	# Remove one`s dirs
	rm -rf $one_dir
	rm -f /etc/init.d/vmcontext

	# self remove
	rm $0
	# and the entire directory
	rmdir `dirname $0`
fi

# Check if CentOS
elif [ -f /etc/redhat-release ]; then
	yum clean all && logrotate -f /etc/logrotate.conf && rm -rf /var/tmp/* && rm -f /etc/ssh/ssh_host_dsa_key && rm -f /etc/ssh/ssh_host_dsa_key.pub && rm -f /etc/ssh/ssh_host_rsa_key && rm -f /etc/ssh/ssh_host_rsa_key.pub && rm -f /etc/ssh/ssh_host_key && rm -f /etc/ssh/ssh_host_key.pub && cat /dev/null > /var/log/anaconda.ifcfg.log && cat /dev/null > /var/log/anaconda.program.log && cat /dev/null > /var/log/anaconda.storage.log && cat /dev/null > /var/log/anaconda.syslog && cat /dev/null > /var/log/anaconda.xlog && cat /dev/null > /var/log/anaconda.yum.log && cat /dev/null > /var/log/boot.log && cat /dev/null > /var/log/btmp && rm -f /var/log/btmp-* && cat /dev/null > /var/log/cron && rm -f /var/log/cron-* && cat /dev/null > /var/log/dmesg && cat /dev/null > /var/log/dracut.log && rm -f /var/log/dracut.log-* && cat /dev/null > /var/log/lastlog && cat /dev/null > /var/log/maillog && rm -f /var/log/maillog-* && cat /dev/null > /var/log/messages && rm -f /var/log/messages-* && cat /dev/null > /var/log/secure && rm -f /var/log/secure-* && cat /dev/null > /var/log/spooler && rm -f /var/log/spooler-* && cat /dev/null > /var/log/tallylog && cat /dev/null > /var/log/wtmp && rm -f /var/log/wtmp-* && cat /dev/null > /var/log/yum.log && rm -f /var/log/yum.log-* && cat /dev/null > /var/log/audit/audit.log && cat /dev/null > /var/log/anaconda.log && history -cw

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
fi

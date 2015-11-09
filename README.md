# OpenNebula Contextualization (Linux VMs)

Custom contextualization scripts.

## CentOS/RHEL

* Disable IPv6 protocol via network & sysctl 
* Forced root password change after first login (via `init.sh`) 
* Self-removing directories `/etc/one-context.d/` & `/tmp/one-context-tmp` after executing all scripts onf VM. (via `init.sh`)
* Self-remove  `/etc/rc.d/init.d/vmcontext`


Gentoo and Win coming soon...
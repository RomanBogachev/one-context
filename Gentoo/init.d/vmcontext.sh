#!/sbin/openrc-run
function export_rc_vars
{
    if [ -f $1 ] ; then
        ONE_VARS=`cat $1 | egrep -e '^[a-zA-Z\-\_0-9]*=' | sed 's/=.*$//'`

        . $1

        for v in $ONE_VARS; do
            export $v
        done
    fi
}

function execute_scripts {
    SCRIPTS_DIR="/etc/one-context.d"
    for script in $SCRIPTS_DIR/*; do
        $script
    done
}

start()
{
    ebegin "Executing VM Context Scripts"
    if [ -e "/dev/disk/by-label/CONTEXT" ]; then
        mount -t iso9660 -L CONTEXT -o ro /mnt
        if [ -f /mnt/context.sh ]; then
            export_rc_vars /mnt/context.sh
        fi

        execute_scripts

        umount /mnt
    else
        execute_scripts
    fi
    eend $? "Failed Executing VM Context Scripts"
}

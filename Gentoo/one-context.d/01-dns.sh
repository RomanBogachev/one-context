#!/bin/bash

export DNS_VARIABLES="DNS $(env | sed 's/=.*$//' | grep -E '^ETH[0-9]+_DNS$' | sort)"

export SEARCH_VARIABLES="SEARCH_DOMAIN $(env | sed 's/=.*$//' | grep -E '^ETH[0-9]+_SEARCH_DOMAIN$' | sort)"

nameservers=$(
    for var in ${DNS_VARIABLES}; do
        value=$(eval "echo \"\${$var}\"")
        if [ -n "$value" ]; then
            echo "$value"
        fi
    done
)

searchdomains=$(
    for var in ${SEARCH_VARIABLES}; do
        value=$(eval "echo \"\${$var}\"")
        if [ -n "$value" ]; then
            echo "$value"
        fi
    done
)

[ -z "$nameservers" ] && exit 0

echo -n '' > /etc/resolv.conf

for nameserver in $nameservers; do
    echo nameserver $nameserver >> /etc/resolv.conf
done

[ -z "$searchdomains" ] && exit 0

echo search $searchdomains >> /etc/resolv.conf

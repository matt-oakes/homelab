#!/bin/sh

router_command() {
    ssh $ROUTER_SSH_USER@$ROUTER_IP -p $ROUTER_SSH_PORT -i /etc/sshid/identity -o stricthostkeychecking=no HOST_IP=$HOST_IP DOMAIN=$DOMAIN "$@"
}

echo "Running Asus DNS checker script..."

if ! router_command "grep \"address=/$DOMAIN/$HOST_IP\" /etc/dnsmasq.conf"; then
    echo "DNS not currently set up. Setting now"
    router_command 'bash -s' <<'ENDSSH'
        CONF_FILE=/etc/dnsmasq.conf
        cp $CONF_FILE $CONF_FILE.bu
        sed -i '/^#DNSSTART$/,/^\#DNSEND$/d;' $CONF_FILE
        cat << EOF >> $CONF_FILE
#DNSSTART
address=/$DOMAIN/$HOST_IP
#DNSEND
EOF
      killall dnsmasq
      dnsmasq --log-async
ENDSSH
    echo "Set"
fi

echo "Done running Asus DNS checker script 2"

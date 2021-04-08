#!bin/bash
EXTNETWORK_CARD=ens192
INTNETWORK_CARD=ens224

nmcli c mod ${EXTNETWORK_CARD} connection.zone external
nmcli c mod ${INTNETWORK_CARD} connection.zone internal

firewall-cmd --zone=external --add-masquerade --permanent
firewall-cmd --zone=internal --add-masquerade --permanent

firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o ${EXTNETWORK_CARD} -j MASQUERADE
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ${INTNETWORK_CARD} -o ${EXTNETWORK_CARD} -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ${EXTNETWORK_CARD} -o ${INTNETWORK_CARD} -m state --state RELATED,ESTABLISHED -j ACCEPT
firewall-cmd --reload


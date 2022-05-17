#!/bin/sh

network=""
zone=""

 if [ "$#" -eq  "2" ]
  then
    echo "Starting script.."
    echo "Network is $1"
    echo "Zone is $2"
    network=$1
    zone=$2
 else
    echo "Error with the arguments. You need to set network and zone args."
    exit 0;
 fi

do_reverse()
{
 dots=$(echo $1 | grep -o "\." | wc -l)

 if [ "$dots" -eq  "3" ]
  then
     echo $1 | awk -F. '{print $4"."$3"." $2"."$1}'
  else
     echo $1 | awk -F. '{print $3"."$2"."$1}'
 fi
}


do_changes()
{
 mv /tmp/ZZ.YY.XX.in-addr.arpa /etc/bind/$1.in-addr.arpa
 sed -i "s/zzzz/$2/g" /etc/bind/$1.in-addr.arpa
 
 mv /tmp/db.zone /etc/bind/db.$2
 sed -i "s/zzzz/$2/g" /etc/bind/db.$2
 sed -i "s/XX.YY.ZZ/$3/g" /etc/bind/db.$2
 
 mv /tmp/named.conf /etc/bind/named.conf
 sed -i "s/zzzz/$2/g" /etc/bind/named.conf
 sed -i "s/ZZ.YY.XX/$1/g" /etc/bind/named.conf
}

reverse=$(do_reverse $1);
do_changes $reverse $zone $network


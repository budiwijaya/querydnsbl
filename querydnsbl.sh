#!/bin/bash
#Query DNS Blacklist v0.1.1
#by budiw_1@yahoo.com

LISTED=listed
LOGFILE=logfile.txt

# Hostname of DNSBL server available on the internet:
# - zen.spamhaus.org
# - dnsbl-1.uceprotect.net
# - b.barracudacentral.org
#
# Default to b.barracudacentral.org if BLLIST is not
# specified
[ -z "$BLLIST" ] && BLLIST=b.barracudacentral.org

#Example:
# Subnet 203.114.224.0 - 203.114.225.0
# SUB1=203
# SUB2=114
# XX=224
# YY=225

[ -z "$SUB1" ] && SUB1="0"
[ -z "$SUB2" ] && SUB2="0"
[ -z "$XX" ] && XX="0"
[ -z "$YY" ] && YY="0"

for (( y=$XX; y<=$YY; y++ ))
do
 echo START > $LOGFILE
 for (( x=1; x<=254; x++ ))
 do
  echo "checking $SUB1.$SUB2."$y"."$x
  host -t A $x.$y.$SUB2.$SUB1.$BLLIST >> $LOGFILE
 done
 grep 127.0.0 $LOGFILE > $LISTED.$y.$SUB2.$SUB1.txt
 sleep 10
done
rm $LOGFILE

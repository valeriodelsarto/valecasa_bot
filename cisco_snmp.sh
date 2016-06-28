#!/bin/bash

/usr/bin/rrdupdate /opt/valecasa_bot/telegram_bot/cisco.rrd N:`/usr/bin/snmpget -v 2c -c ValeCasaMonitor -Oqv 192.168.1.252 1.3.6.1.2.1.2.2.1.10.1`:`/usr/bin/snmpget -v 2c -c ValeCasaMonitor -Oqv 192.168.1.252 1.3.6.1.2.1.2.2.1.16.1`

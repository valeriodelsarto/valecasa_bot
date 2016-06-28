#!/bin/bash

/usr/bin/rrdtool graph /opt/valecasa_bot/telegram_bot/graphs/cisco.png \
        -N \
        -E \
        --start now-24hours \
        --title "adsl bandwidth usage" \
        --width 600 \
        --x-grid MINUTE:60:HOUR:2:HOUR:4:0:%H \
        --height 400 \
        -u 1000000 \
        --lower-limit 0 \
        --vertical-label "bps" \
        --full-size-mode \
-a PNG --title="adsl bandwidth usage" \
'DEF:ciscoin=/home/kodi/.kodi/dev/ruby/telegram_bot/cisco.rrd:in:AVERAGE' \
'CDEF:ciscoinbits=ciscoin,8,*' \
'VDEF:ciscolast=ciscoin,LAST' \
'DEF:ciscoout=/home/kodi/.kodi/dev/ruby/telegram_bot/cisco.rrd:out:AVERAGE' \
'CDEF:ciscooutbits=ciscoout,8,*' \
'AREA:ciscoinbits#33CC33:cisco in ' \
'LINE1:ciscooutbits#0000ff:cisco out' \
'GPRINT:ciscolast:Drawn at %Y-%m-%d, %H\:%M:strftime'

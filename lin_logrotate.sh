#!/bin/bash
# LogRotate for Linux

echo "ESECUZIONE SCRIPT COMPRESSIONE LOG VALECASA_BOT..."

# comprimo i log
for file in /var/log/valecasa_bot/valecasa_bot.log.???????? ; do
  echo "comprimo $file"
  bzip2 $file
done

# cancello i log piu' vecchi di 100 giorni
find /var/log/valecasa_bot/valecasa_bot.log.* -type f -mtime +100 -exec rm {} \;

echo "ESECUZIONE SCRIPT COMPRESSIONE LOG TERMINATA CON SUCCESSO!"
exit 0

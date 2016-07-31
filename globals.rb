$Version = "1.0.3"

$token_file = '/opt/valecasa_bot_telegram.token'
$downl_pass = IO.read('/opt/valecasa_bot_telegram.pass').chomp

# valerio tagetik, valerio privato, meera privato
$array_authorized = Array.new
File.open("/opt/valecasa_bot_telegram.authorized", "r") do |f|
  f.each_line do |line|
    $array_authorized.push(line.chomp.to_i)
  end
end

# valerio privato
$notify = File.read('/opt/valecasa_bot_telegram.notify').chomp.to_i

$array_kodi_folder = Array.new
$array_kodi_folder.push("CartoniAnimati")
$array_kodi_folder.push("Comico")
$array_kodi_folder.push("HD")
$array_kodi_folder.push("SD")
$array_kodi_folder.push("SerieTV")

$cmd_lista_1     = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"show dl\" | sed 1,4d"
$cmd_lista_1_s   = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"show dl\" | sed 1,4d | sed ':a;N;$!ba;s/\\n\\s>\\s\\s//g' | sed 's/\\s>\\s//' | sed 's/^.\\{33\\}//' | sed 's/%].*\\s-\\s/%] /' | sed 's/Auto\\s//' | awk -F'(\\.avi \\[)|(\\.mkv \\[)|(\\.rar \\[)' '{print substr($1,0,30)\" [\"$2}'"
$cmd_lista_2     = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -l"
$cmd_aggiungi_1  = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"add <ed2klink>\" | sed 1,4d"
$cmd_aggiungi_2  = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -a <torrent>"
$cmd_finiti_1    = '/bin/ls -lh /home/kodi/.kodi/aMule/Incoming/'
$cmd_finiti_2    = '/bin/ls -lh /home/kodi/.kodi/torrent/'
$cmd_stato_1     = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"status\" | sed 1,4d"
$cmd_stato_2     = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -st"
$cmd_muovilist_1 = '/bin/ls -1 /home/kodi/.kodi/aMule/Incoming/'
$cmd_muovilist_2 = '/bin/ls -1 /home/kodi/.kodi/torrent/'
$cmd_muovi_1     = '/bin/mv /home/kodi/.kodi/aMule/Incoming/<filename> /home/kodi/.kodi/USB/<folder>/'
$cmd_muovi_2     = '/bin/mv /home/kodi/.kodi/torrent/<filename> /home/kodi/.kodi/USB/<folder>/'
$cmd_salva_1     = '/usr/bin/find /home/kodi/.kodi/aMule/Incoming/ -iregex ".*\.\(avi\|mkv\)$" -exec /bin/mv {} /home/kodi/.kodi/USB/temp/ \;'
$cmd_salva_2     = '/usr/bin/find /home/kodi/.kodi/torrent/ -iregex ".*\.\(avi\|mkv\)$" -exec /bin/mv {} /home/kodi/.kodi/USB/temp/ \;'
$cmd_salva_all_1 = '/bin/mv /home/kodi/.kodi/aMule/Incoming/* /home/kodi/.kodi/download/'
$cmd_salva_all_2 = '/bin/mv /home/kodi/.kodi/torrent/* /home/kodi/.kodi/download/'
$cmd_remove_t    = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -t 1 -r"
$cmd_remove_e    = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"cancel <hash>\" | sed 1,4d"
$cmd_e_choose_1  = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"show dl\" | sed 1,4d | egrep -v \".*\[[0-9]{1,2}\.[0-9]{1,2}\%\].*\" | awk \'{print substr($0, index($0,$3))}\'"
$cmd_e_choose_2  = "/usr/bin/amulecmd -P \"#{$downl_pass}\" -c \"show dl\" | sed 1,4d | egrep -v \".*\[[0-9]{1,2}\.[0-9]{1,2}\%\].*\" | awk \'{print $2}\'"
$cmd_t_choose_1  = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -l | egrep \".* [0-9]{1,3}\% .*\" | awk \'{print $10}\'"
$cmd_remove_t_x  = "/usr/bin/transmission-remote -n valerio:#{$downl_pass} -t <number> -r"

$cmd_ferma_e     = '/usr/bin/sudo /usr/sbin/service amule-daemon stop'
$cmd_avvia_e     = '/usr/bin/sudo /usr/sbin/service amule-daemon start'
$cmd_ferma_t     = '/usr/bin/sudo /usr/sbin/service transmission-daemon stop'
$cmd_avvia_t     = '/usr/bin/sudo /usr/sbin/service transmission-daemon start'

$cmd_kodi_update_video = '/usr/bin/kodi-send --action="UpdateLibrary(video)"'
$cmd_kodi_notifica     = '/usr/bin/kodi-send --action="Notification(<titolo>,<messaggio>,30000)"' # 30 secondi

$cmd_read_hum_temp_sensor = '/usr/bin/sudo /home/kodi/.kodi/dev/ruby/telegram_bot/hum_temp_sensor.py'

$bol_aggiungi_1    = false
$bol_aggiungi_2    = false
$bol_kodi_msg      = false
$bol_kodi_msg_t    = false
$bol_rimuovi_1     = false
$bol_rimuovi_2     = false
$bol_muovi_1       = false
$bol_muovi_2       = false
$bol_muovi_1_step2 = false
$bol_muovi_2_step2 = false

$conta_down_e    = 0
$conta_down_t    = 0
$conta_muovi_e   = 0
$conta_muovi_t   = 0

$file_da_muovere = nil

$kodi_msg_t      = nil

$cisco_bandwidth_cmd   = '/home/kodi/.kodi/dev/ruby/telegram_bot/cisco_graph.sh'
$cisco_bandwidth_graph = '/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/cisco.png'

#PokemonGo-Bot
$pokebot_utenti   = '/bin/ls -1 /opt/PokemonGo-Bot/config.json* | /bin/grep -v example | /bin/grep -v \'config\\.json$\' | /usr/bin/awk -F\'.\' \'{print $3}\' | /usr/bin/sort | /usr/bin/uniq'
$pokebot_utente_N = '/bin/ls -1 /opt/PokemonGo-Bot/config.json* | /bin/grep -v example | /bin/grep -v \'config\\.json$\' | /usr/bin/awk -F\'.\' \'{print $3}\' | /usr/bin/sort | /usr/bin/uniq | /usr/bin/awk \'NR == <number>\''
$pokebot_citta    = '/bin/ls -1 /opt/PokemonGo-Bot/config.json* | /bin/grep -v example | /bin/grep -v \'config\\.json$\' | /usr/bin/awk -F\'.\' \'{print $4}\' | /bin/grep -v \'^$\' | /usr/bin/sort | /usr/bin/uniq'
$pokebot_citta_N  = '/bin/ls -1 /opt/PokemonGo-Bot/config.json* | /bin/grep -v example | /bin/grep -v \'config\\.json$\' | /usr/bin/awk -F\'.\' \'{print $4}\' | /bin/grep -v \'^$\' | /usr/bin/sort | /usr/bin/uniq | /usr/bin/awk \'NR == <number>\''
$pokebot_avvia    = '/usr/bin/nohup /opt/PokemonGo-Bot/<utente>.sh <citta> &> /opt/PokemonGo-Bot/log/<utente>.log &'
$pokebot_checkrun_user = '/usr/bin/pgrep -f \'python ./pokecli.py --config config.json.<utente>\''
$pokebot_checkrun = '/usr/bin/pgrep -f \'python ./pokecli.py\''
$pokebot_checkrun2 = '/bin/ps a | /bin/grep \'python ./pokecli.py\' | /bin/grep -v grep | /usr/bin/awk \'{print $8}\' | /usr/bin/awk -F\'.\' \'{print $3" "$4}\''
$pokebot_checkrun_N = '/bin/ps a | /bin/grep \'python ./pokecli.py\' | /bin/grep -v grep | /usr/bin/awk \'{print $8}\' | /usr/bin/awk -F\'.\' \'{print $3" "$4}\' | /usr/bin/awk \'NR == <number>\''
$pokebot_stop     = '/usr/bin/pkill <utente>'
$pokebot_logpos   = nil
$pokebot_logview1 = "/bin/grep 'Captured\\|Spinning\\|Total\\|appeared\\|exchanged' /opt/PokemonGo-Bot/log/<utente>.log | /usr/bin/tail -c 4090 | /usr/bin/tail -n +2"
$pokebot_logview2 = "/bin/grep 'Captured\\|Spinning\\|Total\\|appeared\\|exchanged' /opt/PokemonGo-Bot/log/<utente>.log | /usr/bin/awk '$0 > \"#{$pokebot_logpos}\"' | /usr/bin/tail -c 4090 | /usr/bin/tail -n +2"
$pokebot_loglast  = "/bin/grep 'Captured\\|Spinning\\|Total\\|appeared\\|exchanged' /opt/PokemonGo-Bot/log/<utente>.log | /usr/bin/tail -1 | /usr/bin/awk '{print $1\" \"$2}'"
$pokebot_logcheck = '/bin/ls -1 /opt/PokemonGo-Bot/log/*.log | /usr/bin/awk -F\'/\' \'{print $5}\' | /usr/bin/awk -F\'.\' \'{print $1}\' | /usr/bin/sort | /usr/bin/uniq'
$pokebot_logcheck_N = '/bin/ls -1 /opt/PokemonGo-Bot/log/*.log | /usr/bin/awk -F\'/\' \'{print $5}\' | /usr/bin/awk -F\'.\' \'{print $1}\' | /usr/bin/sort | /usr/bin/uniq | /usr/bin/awk \'NR == <number>\''

$bol_avvia_pokebot    = false
$bol_citta_pokebot    = false
$bol_ferma_pokebot    = false
$bol_log_pokebot      = false
$conta_utenti_pokebot = 0
$conta_citta_pokebot  = 0
$conta_ferma_pokebot  = 0
$conta_log_pokebot    = 0
$utente_pokebot       = nil

def local_log
  logfile="valecasa_bot.log"
  logpath="/var/log/valecasa_bot/"
  logfilepath = logpath + logfile
  $log = Logger.new(logfilepath, 'daily')
  return $log
end


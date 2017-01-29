$token = nil
if File.exists?($token_file)
  $token = File.read($token_file)
  $token.chomp!
end
begin
  Telegram::Bot::Client.run($token) do |bot|
    bot.listen do |message|
      if $array_authorized.include?(message.from.id)
        puts "Ricevuto messaggio da ID #{message.from.id}, autorizzato!"
        puts "Nome: #{message.from.first_name}"
        puts "Cognome: #{message.from.last_name}"
        puts "Username: #{message.from.username}"
        case message.text
        when '/dimmichisono'
          puts "Ricevuto messaggio /dimmichisono \n"
          bot.api.send_message(chat_id: message.chat.id, text: "Ciao #{message.from.first_name}, il tuo ID è #{message.from.id}, la chat ID è #{message.chat.id}")
        when '/lista_1'
          puts "Ricevuto messaggio /lista_1 \n"
          $log.info("Eseguo comando #{$cmd_lista_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_lista_1)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp.length > 4090
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp.slice(0,4090)}")
              bot.api.send_message(chat_id: message.chat.id, text: "#{stdout.chomp.slice(4090,stdout.chomp.length-4090)}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/lista_1_s'
          puts "Ricevuto messaggio /lista_1_s \n"
          $log.info("Eseguo comando #{$cmd_lista_1_s}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_lista_1_s)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp.length > 4090
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp.slice(0,4090)}")
              bot.api.send_message(chat_id: message.chat.id, text: "#{stdout.chomp.slice(4090,stdout.chomp.length-4090)}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/lista_2'
          puts "Ricevuto messaggio /lista_2 \n"
          $log.info("Eseguo comando #{$cmd_lista_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_lista_2)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/aggiungi_1'
          puts "Ricevuto messaggio /aggiungi_1 \n"
          $bol_aggiungi_1 = true
          bot.api.send_message(chat_id: message.chat.id, text: "OK!\nInviami il link ed2k da aggiungere!")
        when '/aggiungi_2'
          puts "Ricevuto messaggio /aggiungi_2 \n"
          $bol_aggiungi_2 = true
          bot.api.send_message(chat_id: message.chat.id, text: "OK!\nInviami il link torrent o magnet da aggiungere!")
        when '/finiti_1'
          puts "Ricevuto messaggio /finiti_1 \n"
          $log.info("Eseguo comando #{$cmd_finiti_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_finiti_1)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/finiti_2'
          puts "Ricevuto messaggio /finiti_2 \n"
          $log.info("Eseguo comando #{$cmd_finiti_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_finiti_2)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/stato_1'
          puts "Ricevuto messaggio /stato_1 \n"
          $log.info("Eseguo comando #{$cmd_stato_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_stato_1)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/stato_2'
          puts "Ricevuto messaggio /stato_2 \n"
          $log.info("Eseguo comando #{$cmd_stato_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_stato_2)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/muovi_1'
          puts "Ricevuto messaggio /muovi_1 \n"
          $log.info("Eseguo comando #{$cmd_muovilist_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_muovilist_1)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            unless stdout == ""
              messaggio = ""
              array_e_choose = Array.new
              array_e_choose = stdout.split(/\n/)
              conta = 1
              array_e_choose.each do |riga|
                messaggio += "#{conta.to_s}) #{riga}\n"
                conta += 1
              end
              $bol_muovi_1 = true
              $conta_muovi_e = conta - 1
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale file vuoi muovere?")
              bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Non ci sono file da muovere!")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/muovi_2'
          puts "Ricevuto messaggio /muovi_2 \n"
          $log.info("Eseguo comando #{$cmd_muovilist_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_muovilist_2)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            unless stdout == ""
              messaggio = ""
              array_t_choose = Array.new
              array_t_choose = stdout.split(/\n/)
              conta = 1
              array_t_choose.each do |riga|
                messaggio += "#{conta.to_s}) #{riga}\n"
                conta += 1
              end
              $bol_muovi_2 = true
              $conta_muovi_t = conta - 1
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale file vuoi muovere?")
              bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Non ci sono file da muovere!")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/salva_1'
          puts "Ricevuto messaggio /salva_1 \n"
          $log.info("Eseguo comando #{$cmd_salva_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_ferma_e)
          stdout,stderr,status = Open3.capture3($cmd_salva_1) if status.success?
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguito salvataggio temporaneo files video ed2k da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
            stdout,stderr,status = Open3.capture3($cmd_kodi_update_video)
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in salvataggio temporaneo files video ed2k da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
          stdout,stderr,status = Open3.capture3($cmd_avvia_e)
        when '/salva_2'
          puts "Ricevuto messaggio /salva_2 \n"
          $log.info("Eseguo comando #{$cmd_salva_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_ferma_t)
          stdout,stderr,status = Open3.capture3($cmd_salva_2) if status.success?
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguito salvataggio temporaneo files video torrent da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
            stdout,stderr,status = Open3.capture3($cmd_kodi_update_video)
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in salvataggio temporaneo files video torrent da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
          stdout,stderr,status = Open3.capture3($cmd_avvia_t)
          sleep 2
          stdout,stderr,status = Open3.capture3($cmd_remove_t)
        when '/kodi_msg'
          puts "Ricevuto messaggio /kodi_msg \n"
          $bol_kodi_msg = true
          bot.api.send_message(chat_id: message.chat.id, text: "OK!\nInviami il messaggio da visalizzare!")
          bot.api.send_message(chat_id: message.chat.id, text: "Mandami prima il titolo del messaggio:")
        when '/kodi_upd'
          puts "Ricevuto messaggio /kodi_upd \n"
          $log.info("Eseguo comando #{$cmd_kodi_update_video}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_kodi_update_video)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguito reload libreria video kodi da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in reload libreria video kodi da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
        when '/salva_all_1'
          puts "Ricevuto messaggio /salva_all_1 \n"
          $log.info("Eseguo comando #{$cmd_salva_all_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_ferma_e)
          stdout,stderr,status = Open3.capture3($cmd_salva_all_1) if status.success?
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguito salvataggio temporaneo files generici ed2k da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in salvataggio temporaneo files generici ed2k da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
          stdout,stderr,status = Open3.capture3($cmd_avvia_e)
        when '/salva_all_2'
          puts "Ricevuto messaggio /salva_all_2 \n"
          $log.info("Eseguo comando #{$cmd_salva_all_2}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_ferma_t)
          stdout,stderr,status = Open3.capture3($cmd_salva_all_2) if status.success?
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguito salvataggio temporaneo files generici torrent da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in salvataggio temporaneo files generici torrent da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
          stdout,stderr,status = Open3.capture3($cmd_avvia_t)
          sleep 2
          stdout,stderr,status = Open3.capture3($cmd_remove_t)
        when '/rimuovi_1'
          puts "Ricevuto messaggio /rimuovi_1 \n"
          $log.info("Eseguo comando #{$cmd_e_choose_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_e_choose_1)
          errors = true if !stderr.empty?
          if errors == false
            unless stdout == ""
              $log.info("Output: #{stdout.chomp}") if !stdout.empty?
              messaggio = ""
              array_e_choose = Array.new
              array_e_choose = stdout.split(/\n/)
              conta = 1
              array_e_choose.each do |riga|
                messaggio += "#{conta.to_s}) #{riga}\n"
                conta += 1
              end
              $bol_rimuovi_1 = true
              $conta_down_e = conta - 1
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale download vuoi eliminare?")
              bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Non ci sono download da eliminare!")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/rimuovi_2'
          puts "Ricevuto messaggio /rimuovi_2 \n"
          $log.info("Eseguo comando #{$cmd_t_choose_1}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_t_choose_1)
          errors = true if !stderr.empty?
          if errors == false
            unless stdout == ""
              $log.info("Output: #{stdout.chomp}") if !stdout.empty?
              messaggio = ""
              array_t_choose = Array.new
              array_t_choose = stdout.split(/\n/)
              conta = 1
              array_t_choose.each do |riga|
                messaggio += "#{conta.to_s}) #{riga}\n"
                conta += 1
              end
              $bol_rimuovi_2 = true
              $conta_down_t = conta - 1
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale download vuoi eliminare?")
              bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "Non ci sono download da eliminare!")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
        when '/temperatura_e_umidita'
          puts "Ricevuto messaggio /temperatura_e_umidita \n"
          $log.info("Eseguo comando #{$cmd_read_hum_temp_sensor}")
          errors = false
          stdout,stderr,status = Open3.capture3($cmd_read_hum_temp_sensor)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\nRisultato:\n#{stdout.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Eseguita lettura di temperatura e umidita da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in lettura di temperatura e umidita da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
        when '/bandwidth'
          puts "Ricevuto messaggio /bandwidth \n"
          $log.info("Eseguo comando #{$cisco_bandwidth_cmd}")
          errors = false
          stdout,stderr,status = Open3.capture3($cisco_bandwidth_cmd)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "OK!")
            bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/cisco.png', 'image/png'))
            bot.api.send_message(chat_id: $notify, text: "Eseguito controllo bandwidth usage da #{message.from.id} - #{message.from.first_name}") if message.from.id != $notify
            bot.api.send_photo(chat_id: $notify, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/cisco.png', 'image/png')) if message.from.id != $notify
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: $notify, text: "Errore in controllo bandwidth usage da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
          end
        when '/poke_start'
          puts "Ricevuto messaggio /poke_start \n"
          $log.info("Eseguo comando #{$pokebot_utenti}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_utenti)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            messaggio = ""
            array_p_choose = Array.new
            array_p_choose = stdout.split(/\n/)
            conta = 1
            array_p_choose.each do |riga|
              messaggio += "#{conta.to_s}) #{riga}\n"
              conta += 1
            end
            $bol_avvia_pokebot = true
            $conta_utenti_pokebot = conta - 1
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale utente vuoi avviare?")
            bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start completato!")
          end
        when '/poke_stop'
          puts "Ricevuto messaggio /poke_stop \n"
          $log.info("Eseguo comando #{$pokebot_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              bot.api.send_message(chat_id: message.chat.id, text: "Nessun PokeBot avviato!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_stop completato!")
            else
              $log.info("Eseguo comando #{$pokebot_checkrun2}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_checkrun2)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                messaggio = ""
                array_p_choose = Array.new
                array_p_choose = stdout.split(/\n/)
                conta = 1
                array_p_choose.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                $bol_ferma_pokebot = true
                $conta_ferma_pokebot = conta - 1
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale PokeBot vuoi fermare?")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_stop completato!")
              end
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_stop completato!")
          end
        when '/poke_status'
          puts "Ricevuto messaggio /poke_status \n"
          $log.info("Eseguo comando #{$pokebot_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              bot.api.send_message(chat_id: message.chat.id, text: "Nessun PokeBot avviato!")
            else
              $log.info("Eseguo comando #{$pokebot_checkrun2}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_checkrun2)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                messaggio = ""
                array_p_choose = Array.new
                array_p_choose = stdout.chomp.split(/\n/)
                conta = 1
                array_p_choose.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                bot.api.send_message(chat_id: message.chat.id, text: "PokeBot avviati:")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
          bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_status completato!")
        when '/poke_log'
          puts "Ricevuto messaggio /poke_log \n"
          $log.info("Eseguo comando #{$pokebot_logcheck}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_logcheck)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout == ""
              bot.api.send_message(chat_id: message.chat.id, text: "Nessun Log di PokeBot presente!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_log completato!")
            else
              messaggio = ""
              array_p_choose = Array.new
              array_p_choose = stdout.split(/\n/)
              conta = 1
              array_p_choose.each do |riga|
                messaggio += "#{conta.to_s}) #{riga}\n"
                conta += 1
              end
              $bol_log_pokebot = true
              $conta_log_pokebot = conta - 1
              bot.api.send_message(chat_id: message.chat.id, text: "Quale log di PokeBot vuoi consultare?")
              bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_log completato!")
          end
        when '/poke_nomi'
          puts "Ricevuto messaggio /poke_nomi \n"
          $log.info("Eseguo comando #{$pokebot_pokemon_inventari}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_pokemon_inventari)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            messaggio = ""
            array_p_choose = Array.new
            array_p_choose = stdout.split(/\n/)
            conta = 1
            array_p_choose.each do |riga|
              messaggio += "#{conta.to_s}) #{riga}\n"
              conta += 1
            end
            $bol_nomi_pokebot = true
            $conta_nomi_pokebot = conta - 1
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale utente vuoi consultare?")
            bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_nomi completato!")
          end
        when '/poke_conta'
          puts "Ricevuto messaggio /poke_conta \n"
          $log.info("Eseguo comando #{$pokebot_pokemon_inventari}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_pokemon_inventari)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            messaggio = ""
            array_p_choose = Array.new
            array_p_choose = stdout.split(/\n/)
            conta = 1
            array_p_choose.each do |riga|
              messaggio += "#{conta.to_s}) #{riga}\n"
              conta += 1
            end
            $bol_conta_pokebot = true
            $conta_conta_pokebot = conta - 1
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale utente vuoi consultare?")
            bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_conta completato!")
          end
        when '/pokemap_start'
          puts "Ricevuto messaggio /pokemap_start \n"
          $log.info("Eseguo comando #{$pokemap_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokemap_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              $log.info("Eseguo comando #{$pokebot_citta}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_citta)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                messaggio = ""
                array_p_choose = Array.new
                array_p_choose = stdout.split(/\n/)
                conta = 1
                array_p_choose.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                $bol_avvia_pokemap = true
                $conta_citta_pokemap = conta - 1
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale mappa della città vuoi avviare?")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_start completato!")
              end
            else
              $log.info("Eseguo comando #{$pokemap_getcoord}")
              stdout,stderr,status = Open3.capture3($pokemap_getcoord)
              coordinate = stdout.chomp
              citta = Dir.entries("/opt/PokemonGo-Bot/configs/citta").select {|f| next if File.directory?(f); !File.foreach("/opt/PokemonGo-Bot/configs/citta/#{f}").grep(/#{coordinate}/).empty?}[0]
              bot.api.send_message(chat_id: message.chat.id, text: "PokeMap già avviata nella città: #{citta.chomp}!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_start completato!")
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_start completato!")
          end
        when '/pokemap_stop'
          puts "Ricevuto messaggio /pokemap_stop \n"
          $log.info("Eseguo comando #{$pokemap_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokemap_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              bot.api.send_message(chat_id: message.chat.id, text: "Nessuna PokeMap avviata!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_stop completato!")
            else
              $log.info("Eseguo comando #{$pokemap_getcoord}")
              stdout,stderr,status = Open3.capture3($pokemap_getcoord)
              coordinate = stdout.chomp
              citta = Dir.entries("/opt/PokemonGo-Bot/configs/citta").select {|f| next if File.directory?(f); !File.foreach("/opt/PokemonGo-Bot/configs/citta/#{f}").grep(/#{coordinate}/).empty?}[0]
              $log.info("Eseguo comando #{$pokemap_stop}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokemap_stop)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                if stdout.empty?
                  $log.info("Eseguo comando #{$pokemap_stop_coord}")
                  errors = false
                  stdout,stderr,status = Open3.capture3($pokemap_stop_coord)
                  errors = true if !stderr.empty?
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                end
                processo = stdout.chomp
                stdout,stderr,status = Open3.capture3($pokemap_stop1.gsub("<process>",processo))
                stdout,stderr,status = Open3.capture3($pokemap_stop2.gsub("<process>",processo))
                unless citta.nil?
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap città #{citta} stoppata!")
                  bot.api.send_message(chat_id: $notify, text: "PokeMap città #{citta} stoppata da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                else
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap coordinate #{coordinate} stoppata!")
                  bot.api.send_message(chat_id: $notify, text: "PokeMap coordinate #{coordinate} stoppata da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                end
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
          bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_stop completato!")
        when '/pokemap_status'
          puts "Ricevuto messaggio /pokemap_status \n"
          $log.info("Eseguo comando #{$pokemap_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokemap_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              bot.api.send_message(chat_id: message.chat.id, text: "Nessuna PokeMap avviata!")
            else
              $log.info("Eseguo comando #{$pokemap_getcoord}")
              stdout,stderr,status = Open3.capture3($pokemap_getcoord)
              coordinate = stdout.chomp
              citta = Dir.entries("/opt/PokemonGo-Bot/configs/citta").select {|f| next if File.directory?(f); !File.foreach("/opt/PokemonGo-Bot/configs/citta/#{f}").grep(/#{coordinate}/).empty?}[0]
              unless citta.nil?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap città #{citta} attiva!")
                bot.api.send_message(chat_id: message.chat.id, text: "Mappa visibile su: https://pegasus78.ddns.net/map/")
              else
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap coordinate #{coordinate} attiva!")
                bot.api.send_message(chat_id: message.chat.id, text: "Mappa visibile su: https://pegasus78.ddns.net/map/")
              end
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
          end
          bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_status completato!")
        when '/pokemap_show'
          puts "Ricevuto messaggio /pokemap_show \n"
          $log.info("Eseguo comando #{$pokemap_checkrun}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokemap_checkrun)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            if stdout.chomp == ""
              $bol_mostra_mappa = true
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nMandami le coordinate di cui vuoi visualizzare la mappa! (Esempio: 43.7126865,10.9467945)")
            else
              $log.info("Eseguo comando #{$pokemap_getcoord}")
              stdout,stderr,status = Open3.capture3($pokemap_getcoord)
              coordinate = stdout.chomp
              citta = Dir.entries("/opt/PokemonGo-Bot/configs/citta").select {|f| next if File.directory?(f); !File.foreach("/opt/PokemonGo-Bot/configs/citta/#{f}").grep(/#{coordinate}/).empty?}[0]
              unless citta.nil?
                bot.api.send_message(chat_id: message.chat.id, text: "Non posso visualizzare una mappa custom perché la PokeMap è già avviata nella città: #{citta.chomp}!")
              else
                bot.api.send_message(chat_id: message.chat.id, text: "Non posso visualizzare una mappa custom perché la PokeMap è già avviata alle coordinate: #{coordinate}!")
              end
              bot.api.send_message(chat_id: message.chat.id, text: "Mappa visibile su: https://pegasus78.ddns.net/map/")
              #bot.api.send_message(chat_id: message.chat.id, text: "Vuoi visualizzare la mappa di questa città alle coordinate attuali #{coordinate}? (S/N)")
              #$bol_mostra_mappa_attiva = true
            end
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_show completato!")
          end
        when '/poke_start_path'
          puts "Ricevuto messaggio /poke_start_path \n"
          $log.info("Eseguo comando #{$pokebot_utenti}")
          errors = false
          stdout,stderr,status = Open3.capture3($pokebot_utenti)
          errors = true if !stderr.empty?
          if errors == false
            $log.info("Output: #{stdout.chomp}") if !stdout.empty?
            messaggio = ""
            array_p_choose = Array.new
            array_p_choose = stdout.split(/\n/)
            conta = 1
            array_p_choose.each do |riga|
              messaggio += "#{conta.to_s}) #{riga}\n"
              conta += 1
            end
            $bol_avvia_pokebot_path = true
            $conta_utenti_pokebot = conta - 1
            bot.api.send_message(chat_id: message.chat.id, text: "OK!\nQuale utente vuoi avviare?")
            bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
          else
            $log.error(stderr.chomp) if !stderr.empty?
            bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start_path completato!")
          end
        when '/aggiungi_1_multi'
          puts "Ricevuto messaggio /aggiungi_1_multi \n"
          $bol_aggiungi_1_multi = true
          bot.api.send_message(chat_id: message.chat.id, text: "OK!\nInviami il link dropbox del sorgente html da parsare!")
        else
          if $bol_aggiungi_1
            if (message.text =~ URI::regexp("ed2k"))
              puts "Ricevuto ed2k link da aggiungere! \n"
              $log.info("Eseguo comando #{$cmd_aggiungi_1}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_aggiungi_1.gsub("<ed2klink>",message.text))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Aggiunto file ed2k #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in aggiunta file ed2k #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
            else
              puts "Ricevuto ed2k link in formato errato! \n"
              puts "URL ricevuto: #{message.text}"
              bot.api.send_message(chat_id: message.chat.id, text: "ed2k link errato!")
            end
            $bol_aggiungi_1 = false
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /aggiungi_1 completato!")
          elsif $bol_aggiungi_2
            if ((message.text =~ URI::regexp("magnet")) or ((message.text =~ URI::regexp(["http", "https"])) and (message.text.end_with?(".torrent"))))
              puts "Ricevuto magnet o torrent link da aggiungere! \n"
              $log.info("Eseguo comando #{$cmd_aggiungi_2}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_aggiungi_2.gsub("<torrent>",message.text))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Aggiunto file magnet o torrent #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in aggiunta file magnet o torrent #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
            else
              puts "Ricevuto magnet o torrent link in formato errato! \n"
              puts "URL ricevuto: #{message.text}"
              bot.api.send_message(chat_id: message.chat.id, text: "magnet o torrent link errato!")
            end
            $bol_aggiungi_2 = false
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /aggiungi_2 completato!")
          elsif $bol_kodi_msg
            unless $bol_kodi_msg_t
              if message.text.length > 30
                messaggio = message.text[0, 30]
              else
                messaggio = message.text
              end
              $kodi_msg_t = messaggio
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nOra mandami il testo del messaggio:")
              $bol_kodi_msg_t = true
            else
              if message.text.length > 100
                messaggio = message.text[0, 100]
              else
                messaggio = message.text
              end
              puts "Visualizzo messaggio a video su Kodi: titolo: #{$kodi_msg_t}, messaggio: #{messaggio} \n"
              $log.info("Eseguo comando #{$cmd_kodi_notifica}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_kodi_notifica.gsub("<titolo>",$kodi_msg_t).gsub("<messaggio>",messaggio))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Eseguito invio messaggio a video su Kodi da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in invio messaggio a video su Kodi da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nMessaggio visualizzato!")
              $bol_kodi_msg_t = false
              $bol_kodi_msg = false
            end
          elsif $bol_rimuovi_1
            if message.text.to_i > 0 and message.text.to_i <= $conta_down_e
              puts "Cancello il download numero #{message.text} da aMule \n"
              $log.info("Eseguo comando #{$cmd_e_choose_2}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_e_choose_2)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                array_e_choose = Array.new
                array_e_choose = stdout.split(/\n/)
                elimina = array_e_choose[message.text.to_i-1]
                $log.info("Eseguo comando #{$cmd_remove_e.gsub("<hash>",elimina)}")
                stdout,stderr,status = Open3.capture3($cmd_remove_e.gsub("<hash>",elimina))
                errors = true if !stderr.empty?
                if errors == false
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nEliminato il download numero #{message.text}!")
                  bot.api.send_message(chat_id: $notify, text: "Eseguita cancellazione del download numero #{message.text} da aMule da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
                else
                  $log.error(stderr.chomp) if !stderr.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                  bot.api.send_message(chat_id: $notify, text: "Errore in cancellazione del download numero #{message.text} da aMule da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                end
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in selezione hash download numero #{message.text} da cancellare su aMule da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
            else
              puts "Numero errato download da cancellare su aMule: #{message.text} \n"
              $log.info("Numero errato download da cancellare su aMule: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero download errato! Deve essere un numero compreso fra 1 e #{$conta_down_e}!")
            end
            $bol_rimuovi_1 = false
            $conta_down_e = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /rimuovi_1 completato!")
          elsif $bol_rimuovi_2
            if message.text.to_i > 0 and message.text.to_i <= $conta_down_t
              puts "Cancello il download numero #{message.text} da Transmission \n"
              $log.info("Eseguo comando #{$cmd_remove_t_x.gsub("<number>",message.text)}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_remove_t_x.gsub("<number>",message.text))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nEliminato il download numero #{message.text}!")
                bot.api.send_message(chat_id: $notify, text: "Eseguita cancellazione del download numero #{message.text} da Transmission da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in cancellazione del download numero #{message.text} da Transmission da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
            else
              puts "Numero errato download da cancellare su Transmission: #{message.text} \n"
              $log.info("Numero errato download da cancellare su Transmission: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero download errato! Deve essere un numero compreso fra 1 e #{$conta_down_t}!")
            end
            $bol_rimuovi_2 = false
            $conta_down_t = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /rimuovi_2 completato!")
          elsif $bol_muovi_1
            unless $bol_muovi_1_step2 # step 1
              if message.text.to_i > 0 and message.text.to_i <= $conta_muovi_e
                puts "Ricevuto file da muovere numero #{message.text} da aMule \n"
                puts "Chiedo in quale cartella muoverlo \n"
                messaggio = ""
                conta = 1
                $array_kodi_folder.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                $bol_muovi_1_step2 = true
                $file_da_muovere = message.text
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nIn quale cartella vuoi muovere il file?")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                puts "Numero errato file da muovere da aMule: #{message.text} \n"
                $log.info("Numero errato file da muovere da aMule: #{message.text}")
                bot.api.send_message(chat_id: message.chat.id, text: "Numero file errato! Deve essere un numero compreso fra 1 e #{$conta_muovi_e}!")
                $bol_muovi_1 = false
                $conta_muovi_e = 0
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_1 completato!")
              end
            else # step 2
              if message.text.to_i > 0 and message.text.to_i <= $array_kodi_folder.count
                puts "Muovo il file numero #{$file_da_muovere} da aMule nella cartella numero #{message.text} di Kodi \n"
                errors = false
                stdout,stderr,status = Open3.capture3($cmd_muovilist_1)
                errors = true if !stderr.empty?
                if errors == false
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                  array_e_choose = Array.new
                  array_e_choose = stdout.split(/\n/)
                  muovi = array_e_choose[$file_da_muovere.to_i-1]
                  folder = $array_kodi_folder[message.text.to_i-1]
                  $log.info("Eseguo comando #{$cmd_muovi_1.gsub("<filename>",muovi.dump).gsub("<folder>",folder)}")
                  stdout,stderr,status = Open3.capture3($cmd_ferma_e)
                  stdout,stderr,status = Open3.capture3($cmd_muovi_1.gsub("<filename>",muovi).gsub("<folder>",folder)) if status.success?
                  errors = true if !stderr.empty?
                  if errors == false
                    $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                    bot.api.send_message(chat_id: message.chat.id, text: "OK!\nSpostato il file #{muovi} nella cartella #{folder}!")
                    bot.api.send_message(chat_id: $notify, text: "Eseguito spostamento del file #{muovi} da aMule nella cartella #{folder} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
                  else
                    $log.error(stderr.chomp) if !stderr.empty?
                    bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                    bot.api.send_message(chat_id: $notify, text: "Errore in spostamento del file #{muovi} da aMule nella cartella #{folder} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                  end
                  stdout,stderr,status = Open3.capture3($cmd_avvia_e)
                  $bol_muovi_1 = false
                  $bol_muovi_1_step2 = false
                  $conta_muovi_e = 0
                  $file_da_muovere = nil
                  bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_1 completato!")
                else
                  $log.error(stderr.chomp) if !stderr.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                end
              else
                puts "Numero errato cartella in cui muovere il file da aMule: #{message.text} \n"
                $log.info("Numero errato cartella in cui muovere il file da aMule: #{message.text}")
                bot.api.send_message(chat_id: message.chat.id, text: "Numero cartella errato! Deve essere un numero compreso fra 1 e #{$array_kodi_folder.count.to_s}!")
                $bol_muovi_1 = false
                $bol_muovi_1_step2 = false
                $conta_muovi_e = 0
                $file_da_muovere = nil
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_1 completato!")
              end
            end
          elsif $bol_muovi_2
            unless $bol_muovi_2_step2 # step 1
              if message.text.to_i > 0 and message.text.to_i <= $conta_muovi_t
                puts "Ricevuto file da muovere numero #{message.text} da Transmission \n"
                puts "Chiedo in quale cartella muoverlo \n"
                messaggio = ""
                conta = 1
                $array_kodi_folder.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                $bol_muovi_2_step2 = true
                $file_da_muovere = message.text
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nIn quale cartella vuoi muovere il file?")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                puts "Numero errato file da muovere da Transmission: #{message.text} \n"
                $log.info("Numero errato file da muovere da Transmission: #{message.text}")
                bot.api.send_message(chat_id: message.chat.id, text: "Numero file errato! Deve essere un numero compreso fra 1 e #{$conta_muovi_t}!")
                $bol_muovi_2 = false
                $conta_muovi_t = 0
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_2 completato!")
              end
            else # step 2
              if message.text.to_i > 0 and message.text.to_i <= $array_kodi_folder.count
                puts "Muovo il file numero #{$file_da_muovere} da Transmission nella cartella numero #{message.text} di Kodi \n"
                errors = false
                stdout,stderr,status = Open3.capture3($cmd_muovilist_2)
                errors = true if !stderr.empty?
                if errors == false
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                  array_t_choose = Array.new
                  array_t_choose = stdout.split(/\n/)
                  muovi = array_t_choose[$file_da_muovere.to_i-1]
                  folder = $array_kodi_folder[message.text.to_i-1]
                  $log.info("Eseguo comando #{$cmd_muovi_2.gsub("<filename>",muovi).gsub("<folder>",folder)}")
                  stdout,stderr,status = Open3.capture3($cmd_ferma_t)
                  stdout,stderr,status = Open3.capture3($cmd_muovi_2.gsub("<filename>",muovi).gsub("<folder>",folder)) if status.success?
                  errors = true if !stderr.empty?
                  if errors == false
                    $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                    bot.api.send_message(chat_id: message.chat.id, text: "OK!\nSpostato il file #{muovi} nella cartella #{folder}!")
                    bot.api.send_message(chat_id: $notify, text: "Eseguito spostamento del file #{muovi} da Transmission nella cartella #{folder} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
                  else
                    $log.error(stderr.chomp) if !stderr.empty?
                    bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                    bot.api.send_message(chat_id: $notify, text: "Errore in spostamento del file #{muovi} da Transmission nella cartella #{folder} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                  end
                  stdout,stderr,status = Open3.capture3($cmd_avvia_t)
                  $bol_muovi_2 = false
                  $bol_muovi_2_step2 = false
                  $conta_muovi_t = 0
                  $file_da_muovere = nil
                  bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_2 completato!")
                else
                  $log.error(stderr.chomp) if !stderr.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                end
              else
                puts "Numero errato cartella in cui muovere il file da Transmission: #{message.text} \n"
                $log.info("Numero errato cartella in cui muovere il file da Transmission: #{message.text}")
                bot.api.send_message(chat_id: message.chat.id, text: "Numero cartella errato! Deve essere un numero compreso fra 1 e #{$array_kodi_folder.count.to_s}!")
                $bol_muovi_2 = false
                $bol_muovi_2_step2 = false
                $conta_muovi_t = 0
                $file_da_muovere = nil
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /muovi_2 completato!")
              end
            end
          elsif $bol_avvia_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_utenti_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_utente_N.gsub("<number>",message.text))
              pokebot_utente = stdout.chomp
              stdout,stderr,status = Open3.capture3($pokebot_checkrun_user.gsub("<utente>",pokebot_utente))
              if stdout.chomp == ""
                puts "Chiedo in quale città avviare il PokeBot per l'utente #{pokebot_utente} \n"
                $log.info("Eseguo comando #{$pokebot_citta}")
                errors = false
                stdout,stderr,status = Open3.capture3($pokebot_citta)
                errors = true if !stderr.empty?
                if errors == false
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                  messaggio = ""
                  array_pc_choose = Array.new
                  array_pc_choose = stdout.split(/\n/)
                  conta = 1
                  array_pc_choose.each do |riga|
                    messaggio += "#{conta.to_s}) #{riga}\n"
                    conta += 1
                  end
                  $bol_avvia_pokebot = false
                  $bol_citta_pokebot = true
                  $conta_citta_pokebot = conta - 1
                  $conta_utenti_pokebot = 0
                  $utente_pokebot = pokebot_utente
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nIn quale città vuoi avviare l'utente #{pokebot_utente}?")
                  bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
                else
                  $log.error(stderr.chomp) if !stderr.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                end
              else
                puts "Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato! \n"
                $log.info("Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato!")
                bot.api.send_message(chat_id: message.chat.id, text: "Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato!")
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start completato!")
                $bol_avvia_pokebot = false
                $conta_utenti_pokebot = 0
              end
            else
              puts "Numero errato utente da avviare su Pokebot: #{message.text} \n"
              $log.info("Numero errato utente da avviare su Pokebot: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero utente errato! Deve essere un numero compreso fra 1 e #{$conta_utenti_pokebot}!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start completato!")
              $bol_avvia_pokebot = false
              $conta_utenti_pokebot = 0
            end
          elsif $bol_citta_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_citta_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_citta_N.gsub("<number>",message.text))
              pokebot_citta = stdout.chomp
              puts "Avvio il PokeBot per l'utente #{$utente_pokebot} nella città: #{pokebot_citta} \n"
              $log.info("Eseguo comando #{$pokebot_avvia}")
              system("#{$pokebot_avvia.gsub("<utente>",$utente_pokebot).gsub("<citta>",pokebot_citta)} > /opt/PokemonGo-Bot/log/#{$utente_pokebot}.log 2>&1 &")
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot avviato per l'utente #{$utente_pokebot} nella città: #{pokebot_citta}!")
              bot.api.send_message(chat_id: $notify, text: "PokeBot avviato per l'utente #{$utente_pokebot} nella città: #{pokebot_citta} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
            else
              puts "Numero errato città da avviare su Pokebot: #{message.text} \n"
              $log.info("Numero errato città da avviare su Pokebot: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero città errato! Deve essere un numero compreso fra 1 e #{$conta_citta_pokebot}!")
            end
            $bol_citta_pokebot = false
            $conta_citta_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start completato!")
          elsif $bol_ferma_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_ferma_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_checkrun_N.gsub("<number>",message.text))
              stoppami = stdout.chomp.slice(0,stdout.index(" "))
              puts "Fermo il PokeBot per l'utente #{stoppami} \n"
              $log.info("Eseguo comando #{$pokebot_stop}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_stop.gsub("<utente>",stoppami))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                processo = stdout.chomp
                stdout,stderr,status = Open3.capture3($pokebot_stop1.gsub("<process>",processo))
                stdout,stderr,status = Open3.capture3($pokebot_stop2.gsub("<process>",processo))
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot stoppato per l'utente #{stoppami}!")
                bot.api.send_message(chat_id: $notify, text: "PokeBot stoppato per l'utente #{stoppami} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            else
              puts "Numero errato PokeBot da stoppare: #{message.text} \n"
              $log.info("Numero errato PokeBot da stoppare: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero PokeBot da stoppare errato! Deve essere un numero compreso fra 1 e #{$conta_ferma_pokebot}!")
            end
            $bol_ferma_pokebot = false
            $conta_ferma_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_stop completato!")
          elsif $bol_log_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_log_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_logcheck_N.gsub("<number>",message.text))
              pokebot_utente = stdout.chomp
              puts "Leggo il Log del PokeBot dell'utente #{pokebot_utente} \n"
              errors = false
              messaggio = ""
              if $pokebot_logpos == nil
                $log.info("Eseguo comando #{$pokebot_logview1}")
                stdout,stderr,status = Open3.capture3($pokebot_logview1.gsub("<utente>",pokebot_utente))
                messaggio = stdout.chomp
              else
                $log.info("Eseguo comando #{$pokebot_logview2}")
                stdout,stderr,status = Open3.capture3($pokebot_logview2.gsub("<utente>",pokebot_utente))
                messaggio = stdout.chomp
              end
              errors = true if !stderr.empty?
              stdout,stderr,status = Open3.capture3($pokebot_loglast.gsub("<utente>",pokebot_utente))
              ultima_riga_log = stdout.chomp
              $pokebot_logpos = ultima_riga_log
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                if messaggio != ""
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot Log dell'utente #{pokebot_utente}:")
                  bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
                else
                  bot.api.send_message(chat_id: message.chat.id, text: "PokeBot Log dell'utente #{pokebot_utente} vuoto!")
                end
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            else
              puts "Numero errato Log di PokeBot da consultare: #{message.text} \n"
              $log.info("Numero errato Log di PokeBot da consultare: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero Log di PokeBot da consultare errato! Deve essere un numero compreso fra 1 e #{$conta_log_pokebot}!")
            end
            $bol_log_pokebot = false
            $conta_log_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_log completato!")
          elsif $bol_nomi_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_nomi_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_pokemon_inventari_N.gsub("<number>",message.text))
              pokebot_utente = stdout.chomp
              puts "Leggo l'inventario PokeBot dell'utente #{pokebot_utente} \n"
              errors = false
              messaggio = ""
              $log.info("Eseguo comando #{$pokebot_pokemon_nomi}")
              stdout,stderr,status = Open3.capture3($pokebot_pokemon_nomi.gsub("<inventario>",pokebot_utente))
              messaggio = stdout.chomp
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                if messaggio != ""
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot Nomi Pokemon dell'utente #{pokebot_utente}:")
                  bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
                else
                  bot.api.send_message(chat_id: message.chat.id, text: "PokeBot Nomi Pokemon dell'utente #{pokebot_utente} vuoto!")
                end
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            else
              puts "Numero errato utente PokeBot da consultare: #{message.text} \n"
              $log.info("Numero errato utente PokeBot da consultare: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero inventario utente di PokeBot da consultare errato! Deve essere un numero compreso fra 1 e #{$conta_nomi_pokebot}!")
            end
            $bol_nomi_pokebot = false
            $conta_nomi_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_nomi completato!")
          elsif $bol_conta_pokebot
            if message.text.to_i > 0 and message.text.to_i <= $conta_conta_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_pokemon_inventari_N.gsub("<number>",message.text))
              pokebot_utente = stdout.chomp
              puts "Leggo l'inventario PokeBot dell'utente #{pokebot_utente} \n"
              errors = false
              messaggio = ""
              $log.info("Eseguo comando #{$pokebot_pokemon_conta}")
              stdout,stderr,status = Open3.capture3($pokebot_pokemon_conta.gsub("<inventario>",pokebot_utente))
              messaggio = stdout.chomp
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                if messaggio != ""
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot Conta Pokemon dell'utente #{pokebot_utente}:")
                  bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
                else
                  bot.api.send_message(chat_id: message.chat.id, text: "PokeBot Conta Pokemon dell'utente #{pokebot_utente} vuoto!")
                end
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            else
              puts "Numero errato utente PokeBot da consultare: #{message.text} \n"
              $log.info("Numero errato utente PokeBot da consultare: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero inventario utente di PokeBot da consultare errato! Deve essere un numero compreso fra 1 e #{$conta_conta_pokebot}!")
            end
            $bol_conta_pokebot = false
            $conta_conta_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_conta completato!")
          elsif $bol_avvia_pokemap
            if message.text.to_i > 0 and message.text.to_i <= $conta_citta_pokemap
              stdout,stderr,status = Open3.capture3($pokebot_citta_N.gsub("<number>",message.text))
              pokemap_citta = stdout.chomp
              puts "Avvio la PokeMap nella città: #{pokemap_citta} \n"
              $log.info("Eseguo comando #{$pokemap_avvia.gsub("<citta>",pokemap_citta)}")
              system("#{$pokemap_avvia.gsub("<citta>",pokemap_citta)} > /opt/PokemonGo-Map/log/#{pokemap_citta}.log 2>&1 &")
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap avviata nella città: #{pokemap_citta}!")
              bot.api.send_message(chat_id: message.chat.id, text: "Mappa visibile su: https://pegasus78.ddns.net/map/")
              bot.api.send_message(chat_id: $notify, text: "PokeMap avviata nella città: #{pokemap_citta} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
            else
              puts "Numero errato città PokeMap da avviare: #{message.text} \n"
              $log.info("Numero errato città PokeMap da avviare: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero città errato! Deve essere un numero compreso fra 1 e #{$conta_citta_pokemap}!")
            end
            $bol_avvia_pokemap = false
            $conta_citta_pokemap = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_start completato!")
          elsif $bol_mostra_mappa
            # verifico se il messaggio contiene delle coordinate
            coordinate = ""
            if message.location
              coordinate = message.location.latitude.to_s + "," + message.location.longitude.to_s
            else
              if (message.text.delete(' ') =~ /^[0-9]{2}\.[0-9]*\,[0-9]{2}\.[0-9]*$/)
                coordinate = message.text.delete(' ')
              else
                puts "Non hai inviato delle coordinate da visualizzare: #{message.text} \n"
                $log.info("Non hai inviato delle coordinate da visualizzare: #{message.text}")
                bot.api.send_message(chat_id: message.chat.id, text: "Non hai inviato delle coordinate da visualizzare! Esempio: 43.7197133,10.947627")
              end
            end
            unless coordinate == ""
              bot.api.send_message(chat_id: message.chat.id, text: "OK! Carico la mappa, mi serve qualche secondo...")
              puts "Avvio la PokeMap alle coordinate: #{coordinate} \n"
              $log.info("Eseguo comando #{$pokemap_avvia_coord.gsub("<coord>",coordinate)}")
              system("#{$pokemap_avvia_coord.gsub("<coord>",coordinate)} > /opt/PokemonGo-Map/log/#{coordinate}.log 2>&1 &")
              sleep 10
              ###############################################################
              # il caricamento dell'immagine della mappa attiva non funziona
              ###############################################################
              #sleep 10
              #system("#{$pokemap_salvaimg}")
              #puts "Invio l'immagine della PokeMap \n"
              #bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/pokemap.png', 'image/png'))
              #bot.api.send_message(chat_id: $notify, text: "Eseguito upload mappa PokeMap da #{message.from.id} - #{message.from.first_name}") if message.from.id != $notify
              #bot.api.send_photo(chat_id: $notify, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/pokemap.png', 'image/png')) if message.from.id != $notify
              #puts "Fermo la PokeMap \n"
              #$log.info("Eseguo comando #{$pokemap_stop_coord}")
              #errors = false
              #stdout,stderr,status = Open3.capture3($pokemap_stop_coord)
              #errors = true if !stderr.empty?
              #if errors == false
              #  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
              #  processo = stdout.chomp
              #  stdout,stderr,status = Open3.capture3($pokemap_stop1.gsub("<process>",processo))
              #  stdout,stderr,status = Open3.capture3($pokemap_stop2.gsub("<process>",processo))
              #else
              #  $log.error(stderr.chomp) if !stderr.empty?
              #  bot.api.send_message(chat_id: message.chat.id, text: "Errore nello stop della PokeMap!\n#{stderr.chomp}")
              #end
              ###############################################################
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeMap avviata alle coordinate: #{coordinate}!")
              bot.api.send_message(chat_id: message.chat.id, text: "Mappa visibile su: https://pegasus78.ddns.net/map/")
              bot.api.send_message(chat_id: $notify, text: "PokeMap avviata alle coordinate: #{coordinate} da #{message.from.id} - #{message.from.first_name}") if message.from.id != $notify
            end
            $bol_mostra_mappa = false
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_show completato!")
          #elsif $bol_mostra_mappa_attiva
          #  if message.text == "S" or message.text == "s" or message.text == "Y" or message.text == "y"
          #    bot.api.send_message(chat_id: message.chat.id, text: "OK! Genero l'immagine...")
          #    system("#{$pokemap_salvaimg}")
          #    puts "Invio l'immagine della PokeMap \n"
          #    bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/pokemap.png', 'image/png'))
          #    bot.api.send_message(chat_id: $notify, text: "Eseguito upload mappa PokeMap da #{message.from.id} - #{message.from.first_name}") if message.from.id != $notify
          #    bot.api.send_photo(chat_id: $notify, photo: Faraday::UploadIO.new('/home/kodi/.kodi/dev/ruby/telegram_bot/graphs/pokemap.png', 'image/png')) if message.from.id != $notify
          #  else
          #    puts "Risposta negativa mappa attuale da visualizzare: #{message.text} \n"
          #    $log.info("Risposta negativa mappa attuale da visualizzare: #{message.text}")
          #    bot.api.send_message(chat_id: message.chat.id, text: "Ok, non visualizzo nessuna mappa attuale!")
          #  end
          #  $bol_mostra_mappa_attiva = false
          #  bot.api.send_message(chat_id: message.chat.id, text: "Comando /pokemap_show completato!")
          elsif $bol_avvia_pokebot_path
            if message.text.to_i > 0 and message.text.to_i <= $conta_utenti_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_utente_N.gsub("<number>",message.text))
              pokebot_utente = stdout.chomp
              stdout,stderr,status = Open3.capture3($pokebot_checkrun_user.gsub("<utente>",pokebot_utente))
              if stdout.chomp == ""
                puts "Chiedo in quale città avviare il PokeBot per l'utente #{pokebot_utente} \n"
                $log.info("Eseguo comando #{$pokebot_citta}")
                errors = false
                stdout,stderr,status = Open3.capture3($pokebot_citta)
                errors = true if !stderr.empty?
                if errors == false
                  $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                  messaggio = ""
                  array_pc_choose = Array.new
                  array_pc_choose = stdout.split(/\n/)
                  conta = 1
                  array_pc_choose.each do |riga|
                    messaggio += "#{conta.to_s}) #{riga}\n"
                    conta += 1
                  end
                  $bol_avvia_pokebot_path = false
                  $bol_citta_pokebot_path = true
                  $conta_citta_pokebot = conta - 1
                  $conta_utenti_pokebot = 0
                  $utente_pokebot = pokebot_utente
                  bot.api.send_message(chat_id: message.chat.id, text: "OK!\nIn quale città vuoi avviare l'utente #{pokebot_utente}?")
                  bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
                else
                  $log.error(stderr.chomp) if !stderr.empty?
                  bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                end
              else
                puts "Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato! \n"
                $log.info("Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato!")
                bot.api.send_message(chat_id: message.chat.id, text: "Errore, il PokeBot per l'utente #{pokebot_utente} è già avviato!")
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start_path completato!")
                $bol_avvia_pokebot_path = false
                $conta_utenti_pokebot = 0
              end
            else
              puts "Numero errato utente da avviare su Pokebot: #{message.text} \n"
              $log.info("Numero errato utente da avviare su Pokebot: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero utente errato! Deve essere un numero compreso fra 1 e #{$conta_utenti_pokebot}!")
              bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start_path completato!")
              $bol_avvia_pokebot_path = false
              $conta_utenti_pokebot = 0
            end
          elsif $bol_citta_pokebot_path
            if message.text.to_i > 0 and message.text.to_i <= $conta_citta_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_citta_N.gsub("<number>",message.text))
              pokebot_citta = stdout.chomp
              puts "Chiedo in quale percorso avviare il PokeBot per l'utente #{$utente_pokebot} nella città #{pokebot_citta} \n"
              $log.info("Eseguo comando #{$pokebot_path}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_path)
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                messaggio = ""
                array_pc_choose = Array.new
                array_pc_choose = stdout.split(/\n/)
                conta = 1
                array_pc_choose.each do |riga|
                  messaggio += "#{conta.to_s}) #{riga}\n"
                  conta += 1
                end
                $bol_citta_pokebot_path = false
                $bol_path_pokebot_path = true
                $conta_path_pokebot = conta - 1
                $conta_citta_pokebot = 0
                $citta_pokebot = pokebot_citta
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nIn quale percorso vuoi avviare l'utente #{$utente_pokebot} nella città #{pokebot_citta}?")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
            else
              puts "Numero errato città da avviare su Pokebot: #{message.text} \n"
              $log.info("Numero errato città da avviare su Pokebot: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero città errato! Deve essere un numero compreso fra 1 e #{$conta_citta_pokebot}!")
            end
            $bol_citta_pokebot_path = false
            $conta_citta_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start_path completato!")
          elsif $bol_path_pokebot_path
            if message.text.to_i > 0 and message.text.to_i <= $conta_path_pokebot
              stdout,stderr,status = Open3.capture3($pokebot_path_N.gsub("<number>",message.text))
              pokebot_path = stdout.chomp
              puts "Avvio il PokeBot per l'utente #{$utente_pokebot} nella città #{$citta_pokebot} col percorso #{pokebot_path} \n"
              $log.info("Eseguo comando #{$pokebot_avvia}")
              system("#{$pokebot_avvia.gsub("<utente>",$utente_pokebot).gsub("<citta>",$citta_pokebot)} #{pokebot_path} > /opt/PokemonGo-Bot/log/#{$utente_pokebot}.log 2>&1 &")
              bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot avviato per l'utente #{$utente_pokebot} nella città #{$citta_pokebot} col percorso #{pokebot_path}!")
              bot.api.send_message(chat_id: $notify, text: "PokeBot avviato per l'utente #{$utente_pokebot} nella città #{$citta_pokebot} col percorso #{pokebot_path} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
            else
              puts "Numero errato percorso da avviare su Pokebot: #{message.text} \n"
              $log.info("Numero errato percorso da avviare su Pokebot: #{message.text}")
              bot.api.send_message(chat_id: message.chat.id, text: "Numero percorso errato! Deve essere un numero compreso fra 1 e #{$conta_path_pokebot}!")
            end
            $bol_path_pokebot_path = false
            $conta_path_pokebot = 0
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /poke_start_path completato!")
          elsif $bol_aggiungi_1_multi
            if (message.text =~ URI::regexp("dropbox"))
              puts "Ricevuto link dropbox sorgente html da parsare! \n"
              $log.info("Eseguo comando #{$cmd_wget}")
              errors = false
              stdout,stderr,status = Open3.capture3($cmd_wget.gsub("<wget_url>",message.text))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                puts "Scaricato link dropbox, leggo il file e parso il contenuto prendendo tutti i link ed2k! \n"
                $log.info("Scaricato link dropbox, leggo il file e parso il contenuto prendendo tutti i link ed2k!")
                File.open("/tmp/valecasabot_wget_tempfile") do |file|
                  file.each_line do |line|
                    while line =~ /href="ed2k.*"/
                      link_da_aggiungere = line.slice!(/href="ed2k.*?\/"/).chop![6..-1]
                      puts "Trovato link da aggiungere: #{link_da_aggiungere} \n"
                      $log.info("Eseguo comando #{$cmd_aggiungi_1} con link #{link_da_aggiungere}")
                      errors = false
                      stdout,stderr,status = Open3.capture3($cmd_aggiungi_1.gsub("<ed2klink>",link_da_aggiungere))
                      errors = true if !stderr.empty?
                      if errors == false
                        $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                        bot.api.send_message(chat_id: message.chat.id, text: "OK!\n#{stdout.chomp}")
                        bot.api.send_message(chat_id: $notify, text: "Aggiunto file ed2k #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stdout.chomp}") if message.from.id != $notify
                      else
                        $log.error(stderr.chomp) if !stderr.empty?
                        bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                        bot.api.send_message(chat_id: $notify, text: "Errore in aggiunta file ed2k #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
                      end
                    end
                  end
                end
                puts "Parsing del link dropbox completato! Cancello il file temporaneo su disco... \n"
                $log.info("Parsing del link dropbox completato! Cancello il file temporaneo su disco")
                FileUtils.rm("/tmp/valecasabot_wget_tempfile")
                $bol_aggiungi_1_multi = false
                bot.api.send_message(chat_id: message.chat.id, text: "Comando /aggiungi_1_multi completato!")
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
                bot.api.send_message(chat_id: $notify, text: "Errore in download link dropbox #{message.text} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              end
            else
              puts "Ricevuto link dropbox html in formato errato! \n"
              puts "URL ricevuto: #{message.text}"
              bot.api.send_message(chat_id: message.chat.id, text: "link dropbox html errato!")
            end
            $bol_aggiungi_1_multi = false
            bot.api.send_message(chat_id: message.chat.id, text: "Comando /aggiungi_1_multi completato!")
          else
            puts "Ricevuto messaggio #{message.text} \n"
            bot.api.send_message(chat_id: message.chat.id, text: "Comando non riconosciuto!")
          end
        end
      else
        puts "Ricevuto messaggio da ID #{message.from.id}, sconosciuto!"
        puts "Nome: #{message.from.first_name}"
        puts "Cognome: #{message.from.last_name}"
        puts "Username: #{message.from.username}"
        if message.text == '/dimmichisono'
          puts "Ricevuto messaggio /dimmichisono \n"
          bot.api.send_message(chat_id: message.chat.id, text: "Ciao #{message.from.first_name}, il tuo ID è #{message.from.id}, la chat ID è #{message.chat.id}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Unauthorized!")
          bot.api.send_message(chat_id: $notify, text: "Ricevuto messaggio non autorizzato da #{message.from.id} - #{message.from.first_name}, il messaggio era: #{message.text}")
        end
      end
    end
  end
rescue Faraday::Error::ConnectionFailed => e
  $log.warn("NO INTERNET ACCESS!! RETRYING IN 1 MINUTE...")
  sleep(60)
  retry
rescue Faraday::SSLError => e
  $log.warn("SSL ERROR!! RETRYING IN 1 MINUTE...")
  sleep(60)
  retry
rescue Telegram::Bot::Exceptions::ResponseError => e
  $log.warn("Telegram API Exception!! RETRYING IN 1 MINUTE...")
  sleep(60)
  retry
end

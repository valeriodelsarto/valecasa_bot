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
            if stdout == ""
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
            if stdout == ""
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
                array_p_choose = stdout.split(/\n/)
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
                  $log.info("Eseguo comando #{$cmd_muovi_1.gsub("<filename>",muovi).gsub("<folder>",folder)}")
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
              pokebot_utente = stdout
              stdout,stderr,status = Open3.capture3($pokebot_checkrun_user.gsub("<utente>",pokebot_utente))
              if stdout == ""
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
              pokebot_citta = stdout
              puts "Avvio il PokeBot per l'utente #{pokebot_utente} nella città: #{pokebot_citta} \n"
              $log.info("Eseguo comando #{$pokebot_avvia}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_avvia.gsub("<utente>",pokebot_utente).gsub("<citta>",pokebot_citta))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot avviato per l'utente #{pokebot_utente} nella città: #{pokebot_citta}!")
                bot.api.send_message(chat_id: $notify, text: "PokeBot avviato per l'utente #{pokebot_utente} nella città: #{pokebot_citta} da #{message.from.id} - #{message.from.first_name}, risultato: \n#{stderr.chomp}") if message.from.id != $notify
              else
                $log.error(stderr.chomp) if !stderr.empty?
                bot.api.send_message(chat_id: message.chat.id, text: "Errore!\n#{stderr.chomp}")
              end
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
              stoppami = stdout.slice(0,stdout.index(" "))
              puts "Fermo il PokeBot per l'utente #{stoppami} \n"
              $log.info("Eseguo comando #{$pokebot_stop}")
              errors = false
              stdout,stderr,status = Open3.capture3($pokebot_stop.gsub("<utente>",stoppami))
              errors = true if !stderr.empty?
              if errors == false
                $log.info("Output: #{stdout.chomp}") if !stdout.empty?
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
              pokebot_utente = stdout
              puts "Leggo il Log del PokeBot dell'utente #{stdout} \n"
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
                bot.api.send_message(chat_id: message.chat.id, text: "OK!\nPokeBot Log dell'utente #{pokebot_utente}:")
                bot.api.send_message(chat_id: message.chat.id, text: "#{messaggio}")
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
        end
      end
    end
  end
rescue Faraday::Error::ConnectionFailed => e
  $log.warn("NO INTERNET ACCESS!! RETRYING IN 1 MINUTE...")
  sleep(60)
  retry
end

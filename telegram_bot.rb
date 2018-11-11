#!/usr/bin/env ruby

require_relative 'globals'
require 'process/daemon'
require 'telegram/bot'
require 'open3'
require 'uri'
require 'logger'

$log = local_log

class ValeCasa_Bot < Process::Daemon
  def startup
    puts "ValeCasa_Bot daemon starting..."
  end
  def run
    $log.info("ValeCasa_Bot started, version #{$Version}")
    puts "ValeCasa_Bot started, version #{$Version}"
    load 'valecasa.rb'
  end
  def shutdown
    $log.info("###>> ValeCasa_Bot daemon stopping...")
    puts "ValeCasa_Bot daemon stopping..."
  end
end
ValeCasa_Bot.daemonize

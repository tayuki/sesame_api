#! /usr/bin/env ruby

require 'dotenv'
require_relative 'lib/sesame.rb'

Dotenv.load

sesame_token = ENV["SESAME_TOKEN"]

sesame = Sesame.new(sesame_token)

device_ids = sesame.get_device_ids

device_ids.each do |device_id|
  sesame.lock?(device_id)
end

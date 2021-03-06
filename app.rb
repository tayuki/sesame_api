#! /usr/bin/env ruby

require 'sinatra'
require 'dotenv'
require_relative 'lib/sesame.rb'

Dotenv.load

set :bind, ENV["BIND_IP"]
set :port, ENV["PORT"]

sesame_token = ENV["SESAME_TOKEN"]

sesame = Sesame.new(sesame_token)

device_ids = sesame.get_device_ids

get '/lockall' do
  sesame.alllock
  sesame.get_log
end

get '/locks' do
  sesame.locks(device_ids)
  sesame.get_log
end


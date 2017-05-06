#!/usr/bin/env ruby
require 'sinatra'
require 'net/http'
require 'uri'

class Web < Sinatra::Base
  get '/' do
    uri = URI(ENV['MS_URL'])
    puts "callling ms2"
    response = Net::HTTP.get_response(uri)
    status = response.code == '200' ? 'OK': 'NOK'

    "Hello, world. I'm #{status}(#{response.code})\n"
  end
end
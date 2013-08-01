require 'sinatra'
require 'sass'
require "#{File.dirname(__FILE__)}/lib/helpers.rb"

get '/' do
  erb :index
end

get '/css/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"../assets/css/stylesheet"
end

get '/download/windows' do
  redirect 'https://s3.amazonaws.com/autoepg/AutoEPG.exe'
end

get '/download/user-manual' do
  redirect 'https://s3.amazonaws.com/autoepg/autoepg-user-manual.pdf'
end
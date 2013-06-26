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
  redirect 'https://www.dropbox.com/s/naai5cnq2cmt4lj/AutoEPG.exe?dl=1'
end

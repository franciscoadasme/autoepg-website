require 'sinatra'
require 'sass'
require "#{File.dirname(__FILE__)}/lib/helpers.rb"

configure do
  set :version, 'Version 0.9.12 Build 125 (Dec 2014)'
  set :aws_base_url, 'https://s3.amazonaws.com/autoepg/'
end

get '/css/stylesheet.css' do
  content_type 'text/css', charset: 'utf-8'
  scss :"../assets/css/stylesheet"
end

get '/' do
  erb :index
end

get '/download/windows' do
  redirect aws_link_to('A2EPG.exe')
end

get '/download/mac' do
  redirect aws_link_to('A2EPG.dmg')
end

get '/download/linux' do
  redirect aws_link_to('A2EPG.tar.gz')
end

get '/download/user-manual' do
  redirect aws_link_to('a2epg_user_manual.pdf')
end

get '/download/post-analysis' do
  redirect aws_link_to('a2epg_post_analysis.py')
end

get '/release-notes' do
  erb :changelog
end

get '/benchmark' do
  erb :benchmark
end

get %r{/datasets/(\w+)} do
  redirect aws_link_to("a2epg_#{params[:captures][0]}_dataset.zip")
end

require 'sinatra'
require 'sass'
require "#{File.dirname(__FILE__)}/lib/helpers.rb"

configure do
  set :version, 'Version 0.9.11 Build 124 (Aug 2014)'
  set :aws_base_url, 'https://s3.amazonaws.com/autoepg/'
end

get '/' do
  erb :index
end

get '/css/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"../assets/css/stylesheet"
end

get '/download/windows' do
  redirect aws_link_to('A2EPG.exe')
end

get '/download/mac' do
  redirect aws_link_to('A2EPG.dmg')
end

get '/download/linux' do
  redirect aws_link_to('a2epg.tar.gz')
end

get '/download/user-manual' do
  redirect aws_link_to('autoepg-user-manual.pdf')
end

get '/download/benchmark-toolset' do
  redirect aws_link_to('autoepg-benchmark-toolset.zip')
end

get '/download/post-analysis' do
  redirect aws_link_to('autoepg-post-analysis.zip')
end

get %r{/datasets/(\w+)} do
  redirect aws_link_to("autoepg-#{params[:captures][0]}-data-set.zip")
end

get '/release-notes' do
  erb :changelog
end

get '/benchmark' do
  erb :benchmark
end

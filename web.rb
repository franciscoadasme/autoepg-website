require 'sinatra'
require 'digest/md5'
require 'sass'

  helpers do
    def gravatar_for(email, params = {})
      hash = Digest::MD5.hexdigest(email.downcase)
      image_src = "http://www.gravatar.com/avatar/#{hash}?#{URI.encode_www_form params}"
    end
  end

get '/' do
  erb :index
end

get '/css/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"../assets/css/stylesheet"
end

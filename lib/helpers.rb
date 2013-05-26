require 'digest/md5'

include Nanoc::Helpers::Rendering

def gravatar_for(email, params = {})
	hash = Digest::MD5.hexdigest(email.downcase)
	image_src = "http://www.gravatar.com/avatar/#{hash}?#{URI.encode_www_form params}"
end

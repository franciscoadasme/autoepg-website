require 'digest/md5'
require 'active_support/core_ext/integer/inflections'

helpers do
  def gravatar_for(email, params = {})
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "http://www.gravatar.com/avatar/#{hash}?#{URI.encode_www_form params}"
  end

  def version_tag(version, build, date)
    date_format = "%B #{date.day.ordinalize} %Y"
    %Q{<h2>
        #{version}
        <small class="muted">Build #{build}</small>
        <span class="sep">;</span>
        <span class="date">#{date.strftime(date_format)}</span>
      </h2>}
  end

  def tag(kind)
    %Q{<span class="#{kind} tag">#{kind}</span>}
  end
end

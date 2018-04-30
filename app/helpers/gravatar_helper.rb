module GravatarHelper
  def gravatar_image_url(user, size)
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end

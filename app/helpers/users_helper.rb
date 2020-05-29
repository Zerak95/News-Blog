module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  # Returns standard Gravatar.
  def gravatar_no_user( size: 80)
    gravatar_url = "https://secure.gravatar.com/avatar/?s=#{size}"
    image_tag(gravatar_url, alt: "no user", class: "gravatar")
  end

  # Returns the 12 most recent active users.
  def active_users
    @active_users = User.order('last_active DESC').limit(12)
  end
end
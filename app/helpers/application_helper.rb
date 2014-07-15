#encoding: utf-8
module ApplicationHelper
	def full_title(page_title)
		base_title = "Skill Up - сообщество начинающих веб-разработчиков"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def current_user?(user)
		current_user == user	
	end	

  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end	
end

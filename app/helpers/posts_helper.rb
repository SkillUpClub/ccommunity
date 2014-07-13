module PostsHelper
	def created_date(post)
		@post = post
		@post.created_at.strftime("%d %B %Y")		
	end
end

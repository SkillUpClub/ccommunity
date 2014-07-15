atom_feed do |feed|
	feed.title "My blog"
	@posts.each do |post|
		feed.entry(post) do |entry|
			entry.title post.title
			entry.content post.content
		end
	end
end

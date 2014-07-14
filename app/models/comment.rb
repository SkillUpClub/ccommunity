class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates :content, :user_id, :post_id, presence: true
end

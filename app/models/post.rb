# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :url, :content, presence: true, length: { minimum: 3 }
  validates :url, uniqueness: true
  belongs_to :category
  belongs_to :user
  extend FriendlyId
  friendly_id :url
end

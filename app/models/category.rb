# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  validates :title, :url, presence: true, length: { minimum: 3 }
  validates :url, uniqueness: true
  has_many :posts
  extend FriendlyId
  friendly_id :url
end

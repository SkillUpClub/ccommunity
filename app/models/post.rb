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

  belongs_to :category
  belongs_to :user
end

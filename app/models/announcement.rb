class Announcement < ActiveRecord::Base
  belongs_to :user

  validate :content, :active, presence: true
end

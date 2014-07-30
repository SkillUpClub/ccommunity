class Link < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :address, :title, :description, presence: true

  def self.not_approved
    where :approved => false
  end

  def self.approved
    where :approved => true
  end

  def self.not_approved?
    !approved
  end
end

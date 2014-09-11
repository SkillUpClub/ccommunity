class Course < ActiveRecord::Base
  has_many :steps
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :steps, allow_destroy: true
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  invitations_count      :integer          default(0)
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  after_update :get_coordinates

  devise :invitable, 
             :database_authenticatable, 
             #:registerable,
             :recoverable, 
             :rememberable, 
             :trackable,
             :authentication_keys => [:login] 
             #:validatable
  has_many :posts
  has_many :links
  has_many :announcements
  extend FriendlyId
  friendly_id :username
  # validates :twitter, :github, uniqueness: true
  # валидация вызывает ошибку при регистрации, видимо потому что по-умолчанию стоит nil. Нужно как-то поправить

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end


private

  def get_coordinates
    postcode = self.postcode
    gmaps_query= HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{postcode}")
    lat = gmaps_query['results'][0]['geometry']['location']['lat']
    long = gmaps_query['results'][0]['geometry']['location']['lng']
    update_column(:latitude, lat)
    update_column(:longtitude, long)
  end
end

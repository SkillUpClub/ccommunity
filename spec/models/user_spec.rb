require 'rails_helper'

RSpec.describe User, :type => :model do
  it "can register without invitation" do
    user = User.create!(username: "Test", email: "email@email.ru", password: "looooooooongpassword")
  end
end

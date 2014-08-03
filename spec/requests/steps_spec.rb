require 'rails_helper'

RSpec.describe "Steps", :type => :request do
  describe "GET /steps" do
    it "works! (now write some real specs)" do
      get steps_path
      expect(response.status).to be(200)
    end
  end
end

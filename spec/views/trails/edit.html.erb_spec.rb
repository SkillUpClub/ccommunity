require 'rails_helper'

RSpec.describe "trails/edit", :type => :view do
  before(:each) do
    @trail = assign(:trail, Trail.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit trail form" do
    render

    assert_select "form[action=?][method=?]", trail_path(@trail), "post" do

      assert_select "input#trail_title[name=?]", "trail[title]"
    end
  end
end

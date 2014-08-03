require 'rails_helper'

RSpec.describe "trails/new", :type => :view do
  before(:each) do
    assign(:trail, Trail.new(
      :title => "MyString"
    ))
  end

  it "renders new trail form" do
    render

    assert_select "form[action=?][method=?]", trails_path, "post" do

      assert_select "input#trail_title[name=?]", "trail[title]"
    end
  end
end

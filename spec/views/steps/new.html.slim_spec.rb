require 'rails_helper'

RSpec.describe "steps/new", :type => :view do
  before(:each) do
    assign(:step, Step.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new step form" do
    render

    assert_select "form[action=?][method=?]", steps_path, "post" do

      assert_select "input#step_title[name=?]", "step[title]"

      assert_select "textarea#step_description[name=?]", "step[description]"
    end
  end
end
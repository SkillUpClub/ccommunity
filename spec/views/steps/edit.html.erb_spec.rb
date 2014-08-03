require 'rails_helper'

RSpec.describe "steps/edit", :type => :view do
  before(:each) do
    @step = assign(:step, Step.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit step form" do
    render

    assert_select "form[action=?][method=?]", step_path(@step), "post" do

      assert_select "input#step_title[name=?]", "step[title]"
    end
  end
end

require 'rails_helper'

RSpec.describe "steps/index", :type => :view do
  before(:each) do
    assign(:steps, [
      Step.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Step.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of steps" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

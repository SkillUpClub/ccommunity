require 'rails_helper'

RSpec.describe "steps/index", :type => :view do
  before(:each) do
    assign(:steps, [
      Step.create!(
        :title => "Title"
      ),
      Step.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of steps" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end

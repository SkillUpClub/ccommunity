require 'rails_helper'

RSpec.describe "trails/index", :type => :view do
  before(:each) do
    assign(:trails, [
      Trail.create!(
        :title => "Title"
      ),
      Trail.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of trails" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end

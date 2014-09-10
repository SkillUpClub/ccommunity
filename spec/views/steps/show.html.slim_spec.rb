require 'rails_helper'

RSpec.describe "steps/show", :type => :view do
  before(:each) do
    @step = assign(:step, Step.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end

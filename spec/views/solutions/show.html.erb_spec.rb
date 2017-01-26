require 'rails_helper'

RSpec.describe "solutions/show", type: :view do
  before(:each) do
    @solution = assign(:solution, Solution.create!(
      :user => nil,
      :challenge => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

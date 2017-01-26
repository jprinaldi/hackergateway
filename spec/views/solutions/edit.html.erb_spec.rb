require 'rails_helper'

RSpec.describe "solutions/edit", type: :view do
  before(:each) do
    @solution = assign(:solution, Solution.create!(
      :user => nil,
      :challenge => nil
    ))
  end

  it "renders the edit solution form" do
    render

    assert_select "form[action=?][method=?]", solution_path(@solution), "post" do

      assert_select "input#solution_user_id[name=?]", "solution[user_id]"

      assert_select "input#solution_challenge_id[name=?]", "solution[challenge_id]"
    end
  end
end

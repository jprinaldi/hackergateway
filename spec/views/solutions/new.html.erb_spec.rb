require 'rails_helper'

RSpec.describe "solutions/new", type: :view do
  before(:each) do
    assign(:solution, Solution.new(
      :user => nil,
      :challenge => nil
    ))
  end

  it "renders new solution form" do
    render

    assert_select "form[action=?][method=?]", solutions_path, "post" do

      assert_select "input#solution_user_id[name=?]", "solution[user_id]"

      assert_select "input#solution_challenge_id[name=?]", "solution[challenge_id]"
    end
  end
end

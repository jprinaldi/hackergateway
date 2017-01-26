require 'rails_helper'

RSpec.describe "challenges/new", type: :view do
  before(:each) do
    assign(:challenge, Challenge.new(
      :name => "MyString",
      :body => "MyText",
      :category => nil
    ))
  end

  it "renders new challenge form" do
    render

    assert_select "form[action=?][method=?]", challenges_path, "post" do

      assert_select "input#challenge_name[name=?]", "challenge[name]"

      assert_select "textarea#challenge_body[name=?]", "challenge[body]"

      assert_select "input#challenge_category_id[name=?]", "challenge[category_id]"
    end
  end
end

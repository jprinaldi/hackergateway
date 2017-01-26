require 'rails_helper'

RSpec.describe "challenges/edit", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      :name => "MyString",
      :body => "MyText",
      :category => nil
    ))
  end

  it "renders the edit challenge form" do
    render

    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do

      assert_select "input#challenge_name[name=?]", "challenge[name]"

      assert_select "textarea#challenge_body[name=?]", "challenge[body]"

      assert_select "input#challenge_category_id[name=?]", "challenge[category_id]"
    end
  end
end

require "rails_helper"

RSpec.describe "API for WeChall", type: :request do
  describe "validate" do
    before(:each) do
      host! "api.lvh.me"
    end

    it "is unauthorized without a token" do
      get api_wechall_users_validate_path
      expect(response).to have_http_status(401)
    end

    it "is unauthorized without a valid token" do
      api_key = FactoryGirl.create(:api_key)
      get api_wechall_users_validate_path(token: "invlaid #{api_key.token}")
      expect(response).to have_http_status(401)
    end

    it "returns 0 with non-matching credentials" do
      user = FactoryGirl.create(:user)
      api_key = FactoryGirl.create(:api_key)
      get api_wechall_users_validate_path(
        username: user.username,
        email: "different #{user.email}",
        token: api_key.token
      )
      expect(response).to have_http_status(200)
      expect(response.body).to include("0")
    end

    it "returns 1 with matching credentials" do
      user = FactoryGirl.create(:user)
      api_key = FactoryGirl.create(:api_key)
      get api_wechall_users_validate_path(
        username: user.username,
        email: user.email,
        token: api_key.token
      )
      expect(response).to have_http_status(200)
      expect(response.body).to include("1")
    end
  end

  describe "score" do
    it "is unauthorized without a token" do
      user = FactoryGirl.create(:user)
      get api_wechall_users_score_path(user)
      expect(response).to have_http_status(401)
    end

    it "is unauthorized without a valid token" do
      user = FactoryGirl.create(:user)
      api_key = FactoryGirl.create(:api_key)
      get api_wechall_users_score_path(
        username: user.username,
        token: "invlaid #{api_key.token}"
      )
      expect(response).to have_http_status(401)
    end

    it "works" do
      user = FactoryGirl.create(:user)
      challenges = FactoryGirl.create_list(:challenge, 10)
      api_key = FactoryGirl.create(:api_key)
      challenges[0..5].each do |challenge|
        user.solve(challenge)
      end
      data = { score: user.solutions_count, max_score: Challenge.count }
      get api_wechall_users_score_path(
        username: user.username,
        token: api_key.token
      )
      expect(response).to have_http_status(200)
      expect(response.body)
        .to include(data.values.join(":"))
    end
  end
end

# frozen_string_literal: true

RSpec.describe "API for WeChall", type: :request do
  subject { response }

  describe "validate" do
    before do
      host! "api.lvh.me"
    end

    context "without a token" do
      before do
        get api_wechall_users_validate_path
      end

      it { is_expected.to have_http_status(:unauthorized) }
    end

    context "without a valid token" do
      let(:api_key) { FactoryBot.create(:api_key) }

      before do
        get api_wechall_users_validate_path(token: "invlaid #{api_key.token}")
      end

      it { is_expected.to have_http_status(:unauthorized) }
    end

    context "with non-matching credentials" do
      let(:user) { FactoryBot.create(:user) }
      let(:api_key) { FactoryBot.create(:api_key) }

      before do
        get api_wechall_users_validate_path(
          username: user.username,
          email: "different #{user.email}",
          token: api_key.token
        )
      end

      it { is_expected.to have_http_status(:ok) }

      it "returns 0" do
        expect(response.body).to include("0")
      end
    end

    context "with matching credentials" do
      before do
        user = FactoryBot.create(:user)
        api_key = FactoryBot.create(:api_key)
        get api_wechall_users_validate_path(
          username: user.username,
          email: user.email,
          token: api_key.token
        )
      end

      it { is_expected.to have_http_status(:ok) }

      it "returns 1" do
        expect(response.body).to include("1")
      end
    end
  end

  describe "score" do
    context "without a token" do
      let(:user) { FactoryBot.create(:user) }

      before do
        get api_wechall_users_score_path(user)
      end

      it { is_expected.to have_http_status(:unauthorized) }
    end

    context "without a valid token" do
      let(:user) { FactoryBot.create(:user) }
      let(:api_key) { FactoryBot.create(:api_key) }

      before do
        get api_wechall_users_score_path(
          username: user.username,
          token: "invlaid #{api_key.token}"
        )
      end

      it { is_expected.to have_http_status(:unauthorized) }
    end

    context "with a valid token" do
      let(:user) { FactoryBot.create(:user) }
      let(:challenges) do
        challenges = FactoryBot.create_list(:challenge, 10)
        challenges[0..5].each do |challenge|
          user.solve(challenge)
        end
        challenges
      end
      let(:api_key) { FactoryBot.create(:api_key) }
      let(:score_data) do
        {
          username: user.username,
          rank: user.rank,
          score: user.solutions_count,
          max_score: Challenge.count,
          solutions_count: user.solutions_count,
          challenges_count: Challenge.count,
          users_count: User.count
        }
      end

      before do
        get api_wechall_users_score_path(
          username: user.username,
          token: api_key.token
        )
      end

      it { is_expected.to have_http_status(:ok) }

      it "returns a valid result" do
        expect(response.body)
          .to include(score_data.values.join(":"))
      end
    end
  end
end

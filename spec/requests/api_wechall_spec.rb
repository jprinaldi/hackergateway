# frozen_string_literal: true

RSpec.describe "API for WeChall", type: :request do
  subject { response }

  let(:user) { create(:user) }
  let(:api_key) { create(:api_key) }

  describe "validate" do
    before do
      host! "api.lvh.me"
    end

    context "without a token" do
      before do
        get api_wechall_users_validate_path
      end

      it { is_expected.to be_unauthorized }
    end

    context "without a valid token" do
      let(:invalid_token) { "invlaid #{api_key.token}" }

      before do
        get api_wechall_users_validate_path(token: invalid_token)
      end

      it { is_expected.to be_unauthorized }
    end

    context "with non-matching credentials" do
      let(:non_existent_user_email) { "non-existent #{user.email}" }

      before do
        get api_wechall_users_validate_path(
          username: user.username,
          email: non_existent_user_email,
          token: api_key.token
        )
      end

      it { is_expected.to be_ok }

      it "returns 0" do
        expect(response.body).to include("0")
      end
    end

    context "with matching credentials" do
      before do
        get api_wechall_users_validate_path(
          username: user.username,
          email: user.email,
          token: api_key.token
        )
      end

      it { is_expected.to be_ok }

      it "returns 1" do
        expect(response.body).to include("1")
      end
    end
  end

  describe "score" do
    context "without a token" do
      before do
        get api_wechall_users_score_path(user)
      end

      it { is_expected.to be_unauthorized }
    end

    context "without a valid token" do
      before do
        get api_wechall_users_score_path(
          username: user.username,
          token: "invlaid #{api_key.token}"
        )
      end

      it { is_expected.to be_unauthorized }
    end

    context "with a valid token" do
      let(:challenges_count) { 10 }
      let(:solved_challenges_count) { 5 }
      let(:score_data) do
        {
          username: user.username,
          rank: user.rank,
          score: solved_challenges_count,
          max_score: challenges_count,
          solutions_count: solved_challenges_count,
          challenges_count: challenges_count,
          users_count: User.count
        }
      end

      before do
        challenges = create_list(:challenge, challenges_count)
        challenges.first(solved_challenges_count).each do |challenge|
          user.solve(challenge)
        end
        get api_wechall_users_score_path(
          username: user.username,
          token: api_key.token
        )
      end

      it { is_expected.to be_ok }

      it "returns a valid result" do
        expect(response.body)
          .to eq(score_data.values.join(":"))
      end
    end
  end
end

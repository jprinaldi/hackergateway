# frozen_string_literal: true

RSpec.describe AdminUser do
  context "with valid parameters" do
    subject { build(:admin_user) }

    it { is_expected.to be_valid }
  end
end

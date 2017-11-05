# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminUser, type: :model do
  it "has a valid factory" do
    admin_user = FactoryBot.build(:admin_user)
    expect(admin_user).to be_valid
  end
end

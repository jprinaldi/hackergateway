# frozen_string_literal: true

require "rails_helper"

RSpec.describe Role, type: :model do
  it "is invalid without a name" do
    role = FactoryBot.build(:role, name: nil)
    expect(role).not_to be_valid
  end
end

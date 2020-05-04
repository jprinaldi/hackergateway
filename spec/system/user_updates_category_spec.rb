# frozen_string_literal: true

RSpec.describe "User updates category", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before { login_as(admin_user, scope: :admin_user) }

    context "with a non-unique name" do
      let(:existing_category) { FactoryBot.create(:category) }
      let(:current_category) { FactoryBot.create(:category) }

      before do
        visit edit_admin_category_path(current_category)
        fill_in "Name*", with: existing_category.name
        click_button "Update"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:category) { FactoryBot.create(:category) }
      let(:new_category_name) { "c4t3g0ry" }
      let(:new_category_path) { admin_category_path(new_category_name) }

      before do
        visit edit_admin_category_path(category)
        fill_in "Name*", with: new_category_name
        click_button "Update"
      end

      it { is_expected.to have_current_path(new_category_path) }

      it { is_expected.not_to have_content(category.name) }

      it { is_expected.to have_content(new_category_name) }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      category = FactoryBot.create(:category)
      visit edit_admin_category_path(category)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    let(:category) { FactoryBot.create(:category) }

    before { visit edit_admin_category_path(category) }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end

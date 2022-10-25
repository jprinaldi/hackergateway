# frozen_string_literal: true

RSpec.describe "User creates category" do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { create(:admin_user) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit new_admin_category_path
    end

    context "with a non-unique name" do
      let(:existing_category) { create(:category) }

      before do
        fill_in "Name*", with: existing_category.name
        click_button "Create"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:category) { build(:category) }
      let(:last_category_path) { admin_category_path(Category.last) }

      before do
        fill_in "Name*", with: category.name
        click_button "Create"
      end

      it { is_expected.to have_current_path(last_category_path) }

      it { is_expected.to have_content("Category was successfully created") }

      it { is_expected.to have_content(category.name) }
    end
  end

  context "when signed in as a user" do
    let(:user) { create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit new_admin_category_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit new_admin_category_path }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end

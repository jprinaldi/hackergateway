# frozen_string_literal: true

RSpec.describe "User creates FAQ", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }
    let(:faq) { FactoryBot.build(:faq) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit new_admin_faq_path
    end

    context "without a title" do
      before do
        fill_in "Answer", with: faq.answer
        click_button "Create"
      end

      it { is_expected.to have_content("can't be blank") }
    end

    context "without an answer" do
      before do
        fill_in "Title*", with: faq.title
        click_button "Create"
      end

      it { is_expected.to have_content("can't be blank") }
    end

    context "with valid parameters" do
      before do
        fill_in "Title*", with: faq.title
        fill_in "Answer*", with: faq.answer
        click_button "Create"
      end

      it { is_expected.to have_current_path(admin_faq_path(Faq.last)) }

      it { is_expected.to have_content("Faq was successfully created") }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit new_admin_faq_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit new_admin_faq_path }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end

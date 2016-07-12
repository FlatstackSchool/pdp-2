require "rails_helper"

feature "Sign Up" do
  let(:registration_attributes) { attributes_for(:registration) }
  let(:registered_user) { User.find_by(email: registration_attributes[:email]) }
  let(:registered_company) { Company.find_by(subdomain: registration_attributes[:subdomain]) }

  scenario "Visitor signs up" do
    visit sign_up_path

    fill_form(:registration, registration_attributes)
    click_button "Sign up"

    # open_email(registered_user.email)

    # expect(current_email).to have_subject("Confirmation instructions")
    # expect(current_email).to have_body_text(registered_user.full_name)

    # visit_in_email("Confirm my account")

    # expect(page).to have_content("Your email address has been successfully confirmed")
    # expect(page).to have_text(registered_user.email)
  end

  context "Invalid details" do
    let!(:user) { create(:user) }

    scenario "Visitor observers errors" do
      visit sign_up_path

      fill_form(:registration, { email: user.email, subdomain: "test", password: "123456", password_confirmation: "123456" })
      click_button "Sign up"

      expect(page).to have_content "Email has already been taken."
    end
  end
end

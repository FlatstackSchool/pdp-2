require "rails_helper"

feature "Sign Up" do
  let(:sign_up_attributes) { attributes_for(:sign_up) }
  let(:registered_user) { User.find_by(email: sign_up_attributes[:email]) }
  let(:registered_company) { Company.find_by(subdomain: sign_up_attributes[:subdomain]) }

  scenario "Visitor signs up" do
    visit sign_up_path

    fill_form(:sign_up, sign_up_attributes)
    click_button "Sign up"

    # open_email(registered_user.email)

    # expect(current_email).to have_subject("Confirmation instructions")
    # expect(current_email).to have_body_text(registered_user.full_name)

    # visit_in_email("Confirm my account")

    # expect(page).to have_content("Your email address has been successfully confirmed")
    # expect(page).to have_text(registered_user.email)
  end
end

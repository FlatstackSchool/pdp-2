require "rails_helper"

feature "Sign Up" do
  let(:registration_attributes) { attributes_for(:registration) }
  let(:registered_user) { User.find_by(email: registration_attributes[:email]) }
  let(:registered_company) { Company.find_by(subdomain: registration_attributes[:subdomain]) }

  scenario "Visitor signs up" do
    visit sign_up_path

    fill_form(:registration, registration_attributes)
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Welcome ?")
    expect(current_email).to have_body_text(registered_user.full_name)
  end
end

require "rails_helper"

feature "Sign Up to Company" do
  let(:company) { create :company, subdomain: "flatstack" }
  let(:user_attributes) { attributes_for(:user) }

  scenario "Visitor signs up to company" do
    visit new_company_registration_url(subdomain: company.subdomain)

    expect(page).to have_content "Sign up to Flatstack"

    fill_form(:user, user_attributes)
    click_button "Sign up"

    expect(page).to have_content "Sign out"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end

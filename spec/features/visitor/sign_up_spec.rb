require "rails_helper"

feature "Sign Up" do
  let(:registration_attributes) { attributes_for(:registration) }

  scenario "Visitor signs up" do
    visit root_path
    click_link "Sign up"

    expect(page).to have_content "Sign up new company"

    fill_form(:registration, registration_attributes)
    click_button "Sign up"

    expect(page).to have_content "Sign out"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end

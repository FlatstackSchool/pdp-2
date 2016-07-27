require "rails_helper"

feature "Sign In" do
  let(:user) { create :user }
  let(:company) { create :company }
  let!(:account) { create :account, company: company, user: user }

  def sign_in(email, password)
    visit sign_in_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(current_url).to eq "http://#{company.subdomain}.lvh.me/"
    expect(page).to have_content("Sign out")
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid email or password")
  end
end

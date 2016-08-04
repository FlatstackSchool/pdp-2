require "rails_helper"

feature "Missed Subdomain" do
  scenario "Visitor visits not existent subdomain" do
    visit root_url(subdomain: "misseddomain", host: "lvh.me")

    expect(page).to have_content 'Company with subdomain "misseddomain" does not exist.'
    expect(current_url).to eq "http://lvh.me/"
  end
end

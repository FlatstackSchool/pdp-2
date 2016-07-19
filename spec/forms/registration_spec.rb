require "rails_helper"

describe Registration, type: :model do
  let(:registration_attributes) { attributes_for(:registration) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :subdomain }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_presence_of :password_confirmation }
  it { is_expected.not_to allow_value("@example.com").for(:email) }
  it { is_expected.not_to allow_value("www").for(:subdomain) }
  it { is_expected.to validate_confirmation_of :password }

  describe "email validations" do
    let!(:user) { create(:user) }
    let(:registration) { build(:registration, email: user.email) }

    it "validates email uniqueness" do
      expect { registration.valid? }.to change { registration.errors[:email] }
        .to(["Email has already been taken."])
    end
  end

  describe "domain name validations" do
    let!(:company) { create(:company) }
    let(:registration) { build(:registration, subdomain: company.subdomain) }

    it "validates subdomain uniqueness" do
      expect { registration.valid? }.to change { registration.errors[:subdomain] }
        .to(["Subdomain has already been taken."])
    end
  end
end

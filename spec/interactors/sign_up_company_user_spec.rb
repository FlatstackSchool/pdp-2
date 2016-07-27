require "rails_helper"

describe SignUpCompanyUser do
  let!(:company) { create(:company) }

  let(:user_attributes) { attributes_for(:user) }
  let(:params) { user_attributes.merge(subdomain: company.subdomain) }

  let(:interactor) { described_class.new(params) }
  let(:context) { interactor.context }

  it "creates user" do
    expect { interactor.run }.to change { User.count }.by(1)
  end

  it "creates member account" do
    expect { interactor.run }.to change { Account.where(company: company).members.count }.by(1)
  end

  it "sets saved user in context" do
    interactor.run

    expect(context.user).to be_persisted
  end

  context "invalid attributes" do
    let(:user_attributes) { attributes_for(:user).merge(email: nil) }

    it "fails context" do
      interactor.run

      expect(context).to be_failure
    end

    it "does not create user" do
      expect { interactor.run }.not_to change { User.count }
    end
  end
end

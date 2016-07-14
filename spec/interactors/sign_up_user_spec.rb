require "rails_helper"

describe SignUpUser do
  let(:registration_attributes) { attributes_for(:registration) }
  let(:interactor) { described_class.new(registration_attributes) }
  let(:context) { interactor.context }

  it "creates user" do
    expect { interactor.run }.to change { User.count }.by(1)
  end

  it "creates company" do
    expect { interactor.run }.to change { Company.count }.by(1)
  end

  it "creates account" do
    expect { interactor.run }.to change { Account.count }.by(1)
  end

  it "sets saved user and company in context" do
    interactor.run

    expect(context.user).to be_persisted
    expect(context.company).to be_persisted
  end

  context "invalid attributes" do
    let(:registration_attributes) { attributes_for(:registration).merge(email: nil) }

    it "fails context" do
      interactor.run

      expect(context).to be_failure
    end

    it "does not create user" do
      expect { interactor.run }.not_to change { User.count }
    end
  end
end

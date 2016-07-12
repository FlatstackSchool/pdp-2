require "rails_helper"

describe SignUpUser do
  let(:registration_attributes) { attributes_for(:registration) }
  let(:interactor) { described_class.new(registration_attributes) }

  it "creates user" do
    expect { interactor.call }.to change { User.count }.by(1)
  end

  it "creates company" do
    expect { interactor.call }.to change { Company.count }.by(1)
  end

  it "sets saved user and company in context" do
    interactor.call

    expect(interactor.user).to be_persisted
    expect(interactor.company).to be_persisted
  end
end

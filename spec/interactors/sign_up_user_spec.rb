require "rails_helper"

describe SignUpUser do
  let(:registration_attributes) { attributes_for(:registration) }

  def call
    described_class.call(registration_attributes)
  end

  it "creates user" do
    expect { call }.to change { User.count }.by(1)
  end

  it "creates company" do
    expect { call }.to change { Company.count }.by(1)
  end
end

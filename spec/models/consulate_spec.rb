require "rails_helper"

RSpec.describe Consulate, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :code }

  describe "uniqueness validation" do
    subject { described_class.create(code: "xxx", name: "Calgary") }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:code).case_insensitive }
  end

  describe "#name" do
    it "is case-insensitive" do
      consulate = described_class.create(code: "xxx", name: "Calgary")
      expect(described_class.find_by(name: "calgary")).to eq consulate
    end
  end

  describe "#code" do
    it "is case-insensitive" do
      consulate = described_class.create(code: "XXX", name: "Calgary")
      expect(described_class.find_by(code: "xxx")).to eq consulate
    end
  end
end

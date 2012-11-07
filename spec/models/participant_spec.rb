
require 'spec_helper'

describe Participant do

  before { @participant = build(:participant) }
  subject { @participant }

  it { should respond_to :name }
  it { should respond_to :surname }
  it { should respond_to :email }
  it { should respond_to :payment_date }
  it { should respond_to :payment_confirmed }
  it { should be_valid }

  context "when first name is not present" do
    before {@participant.name = "" }
    it { should_not be_valid }
  end

  context "when last name is not present" do
    before { @participant.surname = "" }
    it { should_not be_valid }
  end

  context "when email address is not present" do
    before { @participant.email = "" }
    it { should_not be_valid }
  end

  context "when email is not unique" do
    before(:each) {
        @participant.save
        @participant = build(:participant)
        # this seems to be required to populate the error array?
        @participant.valid?
    }
    it { should_not be_valid }
    its(:errors) { should have_key :email }
  end

  context "when email has an incorrect format" do
    before { @participant.email = "thisiswrong" }
    it { should_not be_valid }
  end

  describe "#paid?" do

    subject { @participant.paid?}

    context "when the payment date hase not been set" do
      before { @participant.payment_date = nil }
      it { should be_false }
    end

    context "when the payment date has been set" do
      before { @participant.payment_date = Time.now }
      it { should be_true }
    end
  end

  describe "#confirm_payment" do
    before { @participant.confirm_payment }
    subject { @participant.confirm_payment }

    it "sets the payment date to the current time" do
      expect(@participant.payment_date).to be_within(1).of(Time.now)
    end

    it "sets the payment confirmed flag to true" do
      expect(@participant.payment_confirmed).to be_true
    end
  end

end

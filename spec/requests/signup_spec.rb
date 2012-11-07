# encoding: UTF-8
require 'spec_helper'

describe "Signing Up", js: true do

  before do
    visit root_path
    click_link "anmelden"
  end

  def signup(user)
    fill_in "Name", with: user.surname
    fill_in "Vorname", with: user.name
    fill_in "Email", with: user.email
    click_button "Anmelden"
  end

  shared_examples_for "a successful signup" do
    before do
      signup(user)
    end

    it "shows the confirmation page"  do
      expect(page).to have_content "Danke für deine Anmeldung!"
    end

    it "sends a confirmation email" do
      expect(last_email.to).to include user.email
    end

    it "has a link to return to the home page" do
      click_link "Zurück"
      expect(page).to have_content "Friends@Snow ist leider schon vorbei!"
    end
  end

  shared_examples_for "an unsuccessful signup" do |error_message|
    before do
      signup(user)
    end

    it "does not show the confirmation page" do
      expect(page).not_to have_content "Danke für deine Anmeldung!"
    end

    it "shows a validation error" do
      expect(page).to have_content error_message
    end

    it "does not send a confirmation email" do
      expect(last_email).to be_nil
    end
  end

  context "with a valid name and email" do
    let(:user) { build(:participant) }
    it_behaves_like "a successful signup"
  end

  context "without any data" do
    let(:user) { build(:participant, name: "", surname: "", email: "") }
    it_behaves_like "an unsuccessful signup", \
                    "Vorname darf nicht leer sein."
  end

  context "without a first name" do
    let(:user) { build(:participant, name: "") }
    it_behaves_like "an unsuccessful signup", \
                    "Vorname darf nicht leer sein."
  end

  context "without a last name" do
    let(:user) { build(:participant, surname: "") }
    it_behaves_like "an unsuccessful signup", \
                    "Name darf nicht leer sein."
  end

  context "without an email address" do
    let(:user) { build(:participant, email: "") }
    it_behaves_like "an unsuccessful signup", \
                    "Email darf nicht leer sein."
  end

  context "with an existing email" do
    let(:user) { create(:participant) }
    it_behaves_like "an unsuccessful signup", \
                    "Email ist bereits angemeldet"
  end
end

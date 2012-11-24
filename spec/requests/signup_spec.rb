# encoding: UTF-8
require 'spec_helper'

describe "Signup", js: true do

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

  it "signs up a user with valid data" do
    user = build(:participant)
    signup(user)

    expect(page).to have_content "Danke für deine Anmeldung!"
    expect(last_email.to).to include user.email
    click_link "Zurück"
    expect(page).to have_content "Friends@Snow ist leider schon vorbei!"
  end

  it "doesn't sign up a user without data" do
    user = build(:participant, name: "", surname: "", email: "")
    signup(user)

    expect(page).not_to have_content "Danke für deine Anmeldung!"
    expect(page).to have_content "Vorname darf nicht leer sein."
    expect(last_email).to be_nil
  end

  it "doesn't sign up a user without a firstname" do
    user = build(:participant, name: "")
    signup(user)

    expect(page).not_to have_content "Danke für deine Anmeldung!"
    expect(page).to have_content "Vorname darf nicht leer sein."
    expect(last_email).to be_nil
  end

  it "doesn't sign up a user without a lastname" do
    user = build(:participant, surname: "")
    signup(user)

    expect(page).not_to have_content "Danke für deine Anmeldung!"
    expect(page).to have_content "Name darf nicht leer sein."
    expect(last_email).to be_nil
  end

  it "doesn't sign up user without an email address" do
    user = build(:participant, email: "")
    signup(user)

    expect(page).not_to have_content "Danke für deine Anmeldung!"
    expect(page).to have_content "Email darf nicht leer sein."
    expect(last_email).to be_nil
  end

  it "doesn't sign up user without an existing address" do
    user = create(:participant)
    signup(user)

    expect(page).not_to have_content "Danke für deine Anmeldung!"
    expect(page).to have_content "Email ist bereits angemeldet"
    expect(last_email).to be_nil
  end

end

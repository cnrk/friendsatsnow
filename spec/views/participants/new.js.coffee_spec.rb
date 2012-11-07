require 'spec_helper'

describe "participants/new.js.coffee", js: true do

  before do
    assign(:participant, build(:participant))
    render
  end

  it "has a name input field" do
    expect(rendered).to have_selector("input#participant_name")
  end
  it "has a firstname input field" do
    expect(rendered).to have_selector("input#participant_surname")
  end
  it "has an email input field" do
    expect(rendered).to have_selector("input#participant_email")
  end
  it "has a submit button" do
    expect(rendered).to have_selector("input", name: "commit", type: "submit")
  end

end

require 'spec_helper'

describe "participants/show.js.coffee", js: true do

  before do
    @participant = build(:participant)
    assign(:participant, @participant)
    render
  end

  it "repeats the email address of the participant" do
    expect(rendered).to have_content(@participant.email)
  end
end

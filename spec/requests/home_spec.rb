describe "Visiting the Home Page" do

  before do
    visit root_path
  end

  it "shows the home page" do
    expect(page).to have_content("Friends@Snow ist leider schon vorbei!")
  end

  it "shows a signup link" do
    expect(page).to have_link "anmelden"
  end
end

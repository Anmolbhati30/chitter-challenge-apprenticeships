feature "Viewing peeps" do
  scenario "Viewing homepage" do
    visit "/peeps"

    expect(page).to have_title "Peeps|Chitter"
    expect(page).to have_content "Peeps"
  end

  scenario "Adding a peep" do
    visit "/peeps"

    click_button "Peep something!"

    fill_in(:message, with: "My first peep!")
    click_button "Peep!"

    expect(page).to have_content "My first peep!"
  end
end

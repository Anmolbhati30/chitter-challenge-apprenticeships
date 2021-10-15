feature "Viewing peeps" do
  scenario "Viewing homepage" do
    visit "/peeps"

    expect(page).to have_title "Peeps|Chitter"
    expect(page).to have_content "Peeps"
  end
end

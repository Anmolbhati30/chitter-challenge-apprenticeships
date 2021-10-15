feature "Viewing test page" do
  scenario "visiting the test page" do
    visit("/test")
    expect(page).to have_content "Test page"
  end

  scenario "Viewing homepage" do
    add_row_to_test_database

    visit "/"

    expect(page).to have_content "Welcome to Chitter!"
  end
end

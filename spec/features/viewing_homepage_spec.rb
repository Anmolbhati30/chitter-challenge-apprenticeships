feature "Viewing home page" do
  scenario "Viewing welcome message" do
    add_row_to_test_database
    visit "/"

    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "Viewing page title" do
    visit "/"
    expect(page).to have_title "Chitter"
  end
end

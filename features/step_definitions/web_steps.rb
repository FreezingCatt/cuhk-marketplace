Given("I am on the home page") do
  visit root_path
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

Given("I am on the books page") do
  visit books_path
end

Given("the following books exist:") do |table|
  table.hashes.each do |book_hash|
    email = book_hash.delete('user_email') || "test@link.cuhk.edu.hk"
    user = User.find_by(email: email) || User.create!(email: email, password: "password123")
    
    Book.create!(book_hash.merge(
      user: user,
      author: "Unknown Author",
      condition: "Good",
      location: "United College"
    ))
  end
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email) || User.create!(email: email, password: "password123")
  
  visit new_user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: "password123"
  click_button "Log in"
end

Given("I am on the details page for {string}") do |title|
  book = Book.find_by(title: title)
  visit book_path(book)
end

Given("I fill in {string} with {string}") do |field, value|
  begin
    fill_in field, with: value
  rescue Capybara::ElementNotFound
    fill_in "rating_#{field.downcase}", with: value
  end
end

When("I press {string}") do |button|
  click_button button
end
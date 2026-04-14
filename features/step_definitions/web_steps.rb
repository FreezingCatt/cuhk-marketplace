Given("I am on the home page") do
  visit root_path
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

Given("I am on the books page") do
  visit books_path
end
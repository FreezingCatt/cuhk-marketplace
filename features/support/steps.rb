Given("I am on the registration page") do
  visit new_user_registration_path
end

When("I fill in the registration form with valid details") do
  fill_in "Name", with: "Test User"
  fill_in "Email", with: "testuser@link.cuhk.edu.hk"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"
end

Then("I should see a confirmation message") do
  expect(page).to have_content("Welcome! You have signed up successfully")
end

Given("I am a registered user") do
  @user = create(:user, confirmed_at: Time.now)
end

Given("I am on the login page") do
  visit new_user_session_path
end

When("I fill in my credentials") do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
end

When("I submit the form") do
  click_button "Log in"
end

Then("I should be logged in") do
  expect(page).to have_content("Welcome")
end

Then("I should see my name on the page") do
  expect(page).to have_content(@user.name)
end

Given("I am logged in as a verified user") do
  @user = create(:user, confirmed_at: Time.now)
  login_as(@user, scope: :user)
end

Given("I am on the communities page") do
  visit communities_path
end

When("I click {string}") do |button|
  click_button or click_link(button)
end

When("I fill in the community details") do
  fill_in "Name", with: "Test Community"
  fill_in "Description", with: "This is a test community for trading"
end

Then("I should see my new community listed") do
  expect(page).to have_content("Test Community")
end

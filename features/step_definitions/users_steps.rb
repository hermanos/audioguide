Given(/^I am a user$/) do
  @user = User.create(email:'basic_user@audioguide.com', password:'user1234')
end

Given(/^I am signed out$/) do
  visit root_path
  click_on 'Sign Out'
end

When(/^I click sign in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in my user credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
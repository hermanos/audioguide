Given(/^I am a user$/) do
  @admin = User.create(email:'admin@audioguide.com', password:'admin123')
end

Given(/^I am signed out$/) do
  visit root_path
  click_on 'Sign Out'
end

When(/^I click sign in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in my admin credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
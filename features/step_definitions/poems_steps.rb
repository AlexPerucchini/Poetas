Given /^I am logged in$/ do
  create_user
  sign_in
end

Given(/^a poem exists with the title (.+)$/) do |title|
  @poem ||= @user.poems.create!(title:title, body:'Some random poem.')
end

When(/visit the poems index page$/) do
  visit poems_path
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content text
end

Then /^show me the page$/ do
  save_and_open_page
end

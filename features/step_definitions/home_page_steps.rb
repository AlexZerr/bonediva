Given /^I am on the home page$/ do
  visit "/"
end

Then /^I should see "(.*?)"$/ do |text|
  page.has_content? text
end

Then /^I should see "(.*?)" in a link$/ do |text|
  page.has_content? text
end


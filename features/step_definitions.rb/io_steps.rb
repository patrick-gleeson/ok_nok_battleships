Given(/^I will enter "([^"]*)" when prompted$/) do |message|
  @input.messages << message
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(@output.messages).to include message
end

Then(/^I should see "(.*?)" last$/) do |message|
  expect(@output.messages.last).to eq message
end

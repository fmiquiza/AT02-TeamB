Then(/^I expect story created with (.*) id$/) do |type|
  require_relative '../../../src/helpers/data_helper'
  expect(DataHelper.verify_type(@response['id'], type)).to be true
end

#####PostWrong

When(/^I create a story with (\d+) characters of name$/) do |number|
  require_relative '../../../src/requests/Stories/stories'
  @body = {:name => 'P' * number.to_i}
end

And(/^I expect numbers of characters are (\d+)$/) do |number|
  number_characters = @response['name'].length
  expect(number.to_i).to eql(number_characters)
  _, _ = @client.delete_request('projects/' + @project_id)
end
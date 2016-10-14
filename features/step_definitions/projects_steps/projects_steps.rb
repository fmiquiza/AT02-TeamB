require_relative '../../../src/requests/Projects/projects'

When(/^Sending a POST request endpoint$/) do
  @json = {:name => 'testProjectDelete05'}
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^The project is deleted$/) do
  Projects.project_delete(@client, @body['id'])
end

And(/^I have a project$/) do
  @json = {:name => 'testProjectDelete05'}
  _, @body = Projects.project_post(@client, @json)
end

When(/^Sending a GET request endpoint$/) do
  @code, _ =Projects.project_get(@client)
end

When(/^Sending a PUT request endpoint$/) do
  @json = {:name => 'testProjectModify05'}
  @code, @body = Projects.project_put(@client, @json, @body['id'])
end

When(/^Sending a GET BY ID request endpoint$/) do
  @code, _ = Projects.project_get_by_id(@client, @body['id'])
end

When(/^Sending a DELETE request endpoint$/) do
  @code = Projects.project_delete(@client, @body['id'])
end

When(/^I sent a post request with (\d+) characters$/) do |number_of_characters|
  text = ''
  @compare_number=number_of_characters
  (0..(number_of_characters.to_i-1)).each { text += 'h'}
  @json = {:name => text}
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^I expect a project was created with the same number of characters that I sent$/) do
  expect(@body['name'].length.to_s == @compare_number.to_s).to be true
end

When(/^I sent a post request with a (.*)$/) do |name|
  @name_sent=name
  @json = {:name => name}
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^I expect a project created with the same name$/) do
  expect(@body['name'] == @name_sent).to be true
end

When(/^I sent a post request with without a type$/) do
  @json = {:name => 'testProjectDelete05'}
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^I expect private the type of project$/) do
  expect(@body['project_type'] == 'private').to be true
end

When(/^I sent a post request with  a public type$/) do
  @json = {:name => 'testProjectDelete05',:project_type=>'public'}
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^I expect public the type of project$/) do
  expect(@body['project_type'] == 'public').to be true
end
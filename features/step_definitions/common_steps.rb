Given(/^I have set a connection to pivotal_tracker API service$/) do
  require_relative '../../src/helpers/rest_client/api_rest_client'
  @client = ApiRestClient.new
end

Then(/^I expect Status code (\d+) for the Test$/) do |http_code|
  # noinspection RubyResolve
  expect(@code.to_s).to eql(http_code.to_s)
end
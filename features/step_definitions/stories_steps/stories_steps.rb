And(/^I have a project (.*) created$/) do |name|
  require_relative '../../../src/requests/Epics/epics'
  @body = {:name => name}
  @epic = Epics.new
  # noinspection RubyResolve
  _, @response_project = @client.post_request('projects', @body)
  @project_id =  (@response_project['id']).to_s
end

######

And(/^I expects story (.*) will be (.*)$/) do |attribute, name|
  actual_name = @response[attribute]
  expect(name).to eql(actual_name)
end

###POST

When(/^I want to create a story with (.*) (.*)$/) do |attribute, story_name|
  require_relative '../../../src/requests/Stories/stories'
  @body = {attribute => story_name}
end

And(/^I send a POST request to (.*) endpoint$/) do |end_point|
  # noinspection RubyResolve
  @code, @response = Stories.stories_post(@client, @project_id, end_point, @body)
  # noinspection RubyResolve
  _, _ = @client.delete_request('projects/' + @project_id)
end

####GET

And(/^I have a list of stories$/) do
  @story = {:name => 'Story'}
  @story2 = {:name => 'Story2'}
  # noinspection RubyResolve
  _, _ = Stories.stories_post(@client, @project_id, 'epics', @story)
  # noinspection RubyResolve
  _, _ = Stories.stories_post(@client, @project_id, 'epics', @story2)
end

When(/^I send a GET request to (.*) endpoint$/) do |end_point|
  # noinspection RubyResolve
  @code, @response_get = Stories.stories_get(@client, @project_id, end_point)
  # noinspection RubyResolve
  _, _ = @client.delete_request('projects/' + @project_id)
end

####PUT

And(/^I want to modify a (.*) endpoint the story (.*) (.*)$/) do |end_point, story_attribute, name|
  require_relative '../../../src/requests/Stories/stories'
  @body_original = {story_attribute => name}
  # noinspection RubyResolve
  _, @response_aux = Stories.stories_post(@client, @project_id, end_point, @body_original)
  @story_id = @response_aux['id'].to_s
end


When(/^I send a PUT request to stories with new name (.*)$/) do |modify_name|
  @body = {:name => modify_name}
  # noinspection RubyResolve
  @code, @response = Stories.stories_put(@client, @project_id, 'stories', @story_id , @body)

  # noinspection RubyResolve
  _, _ = @client.delete_request('projects/' + @project_id)
end

####DELETE


When(/^I want to DELETE (.*) story$/) do |name|
  @body = {:name => name}
  # noinspection RubyResolve
  _, @response = Stories.stories_post(@client, @project_id, 'stories', @body)
  @story_id = @response['id'].to_s
end

And(/^I send a DELETE request to (.*) endpoint$/) do |end_point|
  # noinspection RubyResolve
  @code, _ = Stories.stories_delete(@client, @project_id,end_point, @story_id)

  # noinspection RubyResolve
  _, _ = @client.delete_request('projects/' + @project_id)
end
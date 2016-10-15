But(/^I have a (.*) workspace$/) do |workspace_name|
  require_relative '../../../src/requests/Workspaces/workspaces'
  @json = {:name => 'revisar09'}
  # @workspace = Workspaces.new
  # noinspection RubyResolve
  # _, @response_workspace = @client.post_request('workspaces', @body)

  @code, @body=Workspaces.workspaces_post(@client,@json)

end

# ******************POST steps BEGIN *****************
And(/^I want to create a workspace with the (.*) (.*)$/) do |workspace_attributable, name_workspace|
  require_relative '../../../src/requests/Workspaces/workspaces'
  @body = {workspace_attributable => name_workspace}
  @workspace = Workspaces.new
end

When(/^Sending a POST requests to the (.*) endpoint$/) do |endpoint|
  # noinspection RubyResolve
  @code, @response = Workspaces.workspaces_post(@client, @body)
  @id_workspace = @response['id']
end

And(/^I expect (.*) would be (.*)$/) do |workspace_attributable, name|
  actual_name = @response.fetch(workspace_attributable)
  expect(name).to eql(actual_name)


  # noinspection RubyResolve
  _ = @client.delete_request('my/workspaces/' + @id_workspace.to_s)
end
# ///////////////// POST Scenario END //////////////////

# ********************** GET steps BEGIN ******************
When(/^I send a GET request to workspaces endpoint$/) do
  require_relative '../../../src/requests/Workspaces/workspaces'
  # noinspection RubyResolve
  @code, _ = Workspaces.workspaces_get(@client)
end

# ////////////////// GEt steps END /////////////////////////////



# *************** DELETE scenario Begin **************
Given(/I want to delete an workspace with the name (.*)/) do |workspace_name|
  @body = {:name => workspace_name}

  # noinspection RubyResolve
  _ , @response = Workspaces.workspaces_post(@client, @body)
  @id_workspace = @response['id'].to_s
end

When (/I sent a DELETE request to (.*) endpoint/) do |endpoint|
  # noinspection RubyResolve
  @code = Workspaces.workspaces_delete(@client, @id_workspace)
  # noinspection RubyResolve

end

# ////////////////// DELETE steps END /////////////////////////////

# *************** PUT scenario Begin **************

Then(/^I want to modify my created workspace with the (.*) (.*) to (.*)$/) do |workspace_attribute, last_workspace_name, modified_workspace_name|
  @name_before_changes = {workspace_attribute => last_workspace_name}
  @name_after_changes = {workspace_attribute => modified_workspace_name}
  # noinspection RubyResolve
  @json={:name=> 'puts02'}
   _, @response_workspace = Workspaces.workspaces_post(@client, @json)

  @id_workspace = @response_workspace['id'].to_s
end

When(/^I am sending a PUT request to (.*) endpoint$/) do |endpoint|
  # noinspection RubyResolve

  @json={:name=>'blabla06'}

  @code, @response = Workspaces.workspaces_put(@client, @body['id'].to_s,@json)

 end

# ////////////////// PUT steps END /////////////////////////////
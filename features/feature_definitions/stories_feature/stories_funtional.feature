@functional
  Feature: Stories Functional Test

    @post
    Scenario: Stories Functional Post
      Given I have set a connection to pivotal_tracker API service
      And I have a project SmokeStories created
      When I want to create a story with name TestStory
      And I send a POST request to stories endpoint
      Then I expect story created with Integer id
      And I expect Status code 200 for the Test

    @post
    Scenario: Story name with max characters
       Given I have set a connection to pivotal_tracker API service
       And I have a project SmokeStories created
       When I create a story with 5000 characters of name
       And I send a POST request to stories endpoint
       Then I expect Status code 200 for the Test
       And I expect numbers of characters are 5000

    @negative
    Scenario: Story name with max characters
      Given I have set a connection to pivotal_tracker API service
      And I have a project SmokeStories created
      When I create a story with 5001 characters of name
      And I send a POST request to stories endpoint
      Then I expect Status code 400 for the Test
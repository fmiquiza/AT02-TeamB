@api_test
Feature: Epic Negative test


  @negative @post @nameEpic
Scenario: Negative of epic name
Given I have set a connection to pivotal_tracker API service
And I have a ProjectEpicTest project
Then I want to create and epic with 256 characters in his name
When Sending a POST request to epics endpoint to create the epic
Then I expect Status code 400 for the Test
And The epic shouldn't be created
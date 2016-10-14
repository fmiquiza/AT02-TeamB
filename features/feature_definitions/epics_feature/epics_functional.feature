@api_test
Feature: Epic Functional test

@functional @post @epic
Scenario: Epic create
  Given I have set a connection to pivotal_tracker API service
  And I have a ProjectEpicTest project
  Then I want to create an epic with the name EpicTest in the project
  When Sending a POST request to epics endpoint to create the epic
  Then I expect Status code 200 for the SmokeTest
  Then expect name should be EpicTest
  And expect kind should be epic
  And id should be an Integer


  @functional @delete @epic
  Scenario: Epic delete
    Given I have set a connection to pivotal_tracker API service
    And I have a ProjectEpicTest project
    Then I want to delete an epic with the name EpicTest
    When I sending a DELETE request to epics endpoint
    Then I expect Status code 204 for the SmokeTest

  @functional @get @epics
  Scenario: Epics get
    Given I have set a connection to pivotal_tracker API service
    And I have a ProjectEpicTest project
    And I have created two epics EpicOne and EpicTwo
    And I want to get epics in the project
    Given I should have 2 epics
    Then one this should have EpicOne name
    And the other EpicTwo name

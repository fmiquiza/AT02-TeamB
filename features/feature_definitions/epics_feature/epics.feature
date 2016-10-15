@api_test
Feature: Epic Smoke Tests

  @smoke @post @epic
  Scenario: Epic create
    Given I have set a connection to pivotal_tracker API service
    And I have a ProjectEpicTest project
    Then I want to create an epic with the name EpicTest in the project
    When Sending a POST request to epics endpoint to create the epic
    Then I expect Status code 200 for the Test
    And  expect name of epic will be EpicTest

  @smoke @delete @epic
  Scenario: Epic delete
    Given I have set a connection to pivotal_tracker API service
    And I have a ProjectEpicTest project
    Then I want to delete an epic with the name EpicTest
    When I sending a DELETE request to epics endpoint
    Then I expect Status code 204 for the Test

  @smoke @get @epics
     Scenario: Epics get
     Given I have set a connection to pivotal_tracker API service
     And I have a ProjectEpicTest project
     Then I want to get all epics in this project
     When I sending a GET request to epics endpoint
     Then I expect Status code 200 for the Test

  @smoke @put @epic
      Scenario: Epic put
      Given I have set a connection to pivotal_tracker API service
      And I have a ProjectEpicTest project
      Then I want to modify an epic with the name EpicTest to EpicTest2
      When I sending a PUT request to epics endpoint
      Then I expect Status code 200 for the Test

  @smoke @getSpecific @epic
    Scenario: Epic get
    Given I have set a connection to pivotal_tracker API service
    And I have a ProjectEpicTest project
    Then I want to get an epic with the name EpicTest
    When I sending GET request to epics endpoint
    Then I expect Status code 200 for the Test


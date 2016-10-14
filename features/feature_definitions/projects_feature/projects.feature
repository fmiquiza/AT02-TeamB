@api_test
Feature: Project Smoke Tests

  @smoke
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When Sending a POST request endpoint
    Then I expect Status code 200 for the Test
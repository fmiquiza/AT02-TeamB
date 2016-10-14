@api_test
Feature: Project Smoke Tests

  @smoke
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When Sending a POST request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Get
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a GET request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Put
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a PUT request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Get by id
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a GET BY ID request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Delete
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a DELETE request endpoint
    Then I expect Status code 204 for the SmokeTest

  @functional
  Scenario: Verify that create a project the name size accepted 50 characters
    Given I have set a connection to pivotal_tracker API service
    When I sent a post request with 50 characters
    Then I expect Status code 200 for the SmokeTest
    Then I expect a project was created with the same number of characters that I sent
    Then The project is deleted

  @functional
  Scenario Outline: Verify that the project created have the same name I sent
    Given I have set a connection to pivotal_tracker API service
    When I sent a post request with a <name>
    Then I expect Status code 200 for the SmokeTest
    Then I expect a project created with the same name
    Then The project is deleted
    Examples:
      | name           |
      | abcefghijklmno |
      | ldkjalkjdjhlkjhds;lkja |

  @functional
  Scenario: Verify that create a project, that have the private type
    Given I have set a connection to pivotal_tracker API service
    When I sent a post request with without a type
    Then I expect Status code 200 for the SmokeTest
    Then I expect private the type of project
    Then The project is deleted

  @functional
  Scenario: Verify that I sent a post with type public, that will create with the same type
    Given I have set a connection to pivotal_tracker API service
    When I sent a post request with  a public type
    Then I expect Status code 200 for the SmokeTest
    Then I expect public the type of project
    Then The project is deleted
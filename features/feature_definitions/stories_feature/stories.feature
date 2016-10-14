@api_test @story @smoke
Feature: Stories Smoke Tests

  @smoke @story @post
  Scenario: Stories Post
    Given I have set a connection to pivotal_tracker API service
    And I have a project SmokeStories created
    When I want to create a story with name TestStory04
    And I send a POST request to stories endpoint
    Then I expect Status code 200 for the Test
    And I expects story name will be TestStory04

  @smoke @story @get
  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
    And I have a project SmokeStories created
    And I have a list of stories
    When I send a GET request to stories endpoint
    Then I expect Status code 200 for the Test

  @smoke @story @put
  Scenario: Stories Put
    Given I have set a connection to pivotal_tracker API service
    And I have a project SmokeStories created
    When I want to modify a stories endpoint the story name ActualStory
    And I send a PUT request to stories with new name StoryModify
    Then I expect Status code 200 for the Test
    And I expects story name will be StoryModify

  @smoke @story @delete
  Scenario: Stories Delete
    Given I have set a connection to pivotal_tracker API service
    And I have a project SmokeStories created
    When I want to DELETE StoryTest story
    And I send a DELETE request to stories endpoint
    Then I expect Status code 204 for the Test
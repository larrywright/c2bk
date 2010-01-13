Feature: Manage teams
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new team
    Given I am on the new team page
    When I fill in "Name" with "name 1"
      And I fill in "Sms code" with "sms_code 1"
      And I fill in "Game" with "game_id 1"
      And I press "Create"
    Then I should see "name 1"
    And I should see "sms_code 1"
    And I should see "game_id 1"

  Scenario: Delete team
    Given the following teams:
      |name|sms_code|game_id|
      |name 1|sms_code 1|game_id 1|
      |name 2|sms_code 2|game_id 2|
      |name 3|sms_code 3|game_id 3|
      |name 4|sms_code 4|game_id 4|
    When I delete the 3rd team
    Then I should see the following teams:
      |Name|Sms code|Game|
      |name 1|sms_code 1|game_id 1|
      |name 2|sms_code 2|game_id 2|
      |name 4|sms_code 4|game_id 4|

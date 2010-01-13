Feature: Manage players
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new player
    Given I am on the new player page
    When I fill in "Email" with "email 1"
      And I fill in "Username" with "username 1"
      And I fill in "Password salt" with "password_salt 1"
      And I fill in "Password hash" with "password_hash 1"
      And I fill in "Textmarks uid" with "textmarks_uid 1"
      And I fill in "Textmarks phone" with "textmarks_phone 1"
      And I press "Create"
    Then I should see "email 1"
    And I should see "username 1"
    And I should see "password_salt 1"
    And I should see "password_hash 1"
    And I should see "textmarks_uid 1"
    And I should see "textmarks_phone 1"

  Scenario: Delete player
    Given the following players:
      |email|username|password_salt|password_hash|textmarks_uid|textmarks_phone|
      |email 1|username 1|password_salt 1|password_hash 1|textmarks_uid 1|textmarks_phone 1|
      |email 2|username 2|password_salt 2|password_hash 2|textmarks_uid 2|textmarks_phone 2|
      |email 3|username 3|password_salt 3|password_hash 3|textmarks_uid 3|textmarks_phone 3|
      |email 4|username 4|password_salt 4|password_hash 4|textmarks_uid 4|textmarks_phone 4|
    When I delete the 3rd player
    Then I should see the following players:
      |Email|Username|Password salt|Password hash|Textmarks uid|Textmarks phone|
      |email 1|username 1|password_salt 1|password_hash 1|textmarks_uid 1|textmarks_phone 1|
      |email 2|username 2|password_salt 2|password_hash 2|textmarks_uid 2|textmarks_phone 2|
      |email 4|username 4|password_salt 4|password_hash 4|textmarks_uid 4|textmarks_phone 4|

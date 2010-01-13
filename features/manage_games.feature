Feature: Manage games
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new game
    Given I am on the new game page
    When I fill in "Title" with "title 1"
      And I fill in "Geo tl lat" with "geo_tl_lat 1"
      And I fill in "Geo tl lon" with "geo_tl_lon 1"
      And I fill in "Geo br lat" with "geo_br_lat 1"
      And I fill in "Geo br lon" with "geo_br_lon 1"
      And I fill in "Start" with "start 1"
      And I fill in "Puppetmaster" with "puppetmaster_id 1"
      And I press "Create"
    Then I should see "title 1"
    And I should see "geo_tl_lat 1"
    And I should see "geo_tl_lon 1"
    And I should see "geo_br_lat 1"
    And I should see "geo_br_lon 1"
    And I should see "start 1"
    And I should see "puppetmaster_id 1"

  Scenario: Delete game
    Given the following games:
      |title|geo_tl_lat|geo_tl_lon|geo_br_lat|geo_br_lon|start|puppetmaster_id|
      |title 1|geo_tl_lat 1|geo_tl_lon 1|geo_br_lat 1|geo_br_lon 1|start 1|puppetmaster_id 1|
      |title 2|geo_tl_lat 2|geo_tl_lon 2|geo_br_lat 2|geo_br_lon 2|start 2|puppetmaster_id 2|
      |title 3|geo_tl_lat 3|geo_tl_lon 3|geo_br_lat 3|geo_br_lon 3|start 3|puppetmaster_id 3|
      |title 4|geo_tl_lat 4|geo_tl_lon 4|geo_br_lat 4|geo_br_lon 4|start 4|puppetmaster_id 4|
    When I delete the 3rd game
    Then I should see the following games:
      |Title|Geo tl lat|Geo tl lon|Geo br lat|Geo br lon|Start|Puppetmaster|
      |title 1|geo_tl_lat 1|geo_tl_lon 1|geo_br_lat 1|geo_br_lon 1|start 1|puppetmaster_id 1|
      |title 2|geo_tl_lat 2|geo_tl_lon 2|geo_br_lat 2|geo_br_lon 2|start 2|puppetmaster_id 2|
      |title 4|geo_tl_lat 4|geo_tl_lon 4|geo_br_lat 4|geo_br_lon 4|start 4|puppetmaster_id 4|

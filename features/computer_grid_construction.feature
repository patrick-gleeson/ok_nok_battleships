Feature: Computer grid construction

  As a player
  I want the computer's battle grid to be constructed
  So that I can go hunting

  Scenario: Get told that computer grid is being created
    Given I have not started playing
    When I start a new game with name "Susan"
    Then I should see "Creating computer grid..."
    And I should see "Computer grid created!"
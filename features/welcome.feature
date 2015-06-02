Feature: Welcome

  As a player
  I want to reassurance that the game has started
  So that I can start to play

  Scenario: See welcome message
    Given I have not started playing
    When I start a new game
    Then I should see "Welcome to OkNokBattleships!"
    And I should see "What is your name?"
  
  Scenario: Enter name
    Given I have not started playing
    And I will enter "Joe" when prompted
    When I start a new game
    Then I should see "Hi Joe!" last
  
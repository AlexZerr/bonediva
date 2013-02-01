Feature: viewer visits the home page
  Given I am on the home page
  As a viewer
  I want to see the home page of bonediva

  Scenario: view the home page
    Given I am on the home page
    Then I should see "BoneDiva"

  Scenario:View the home page
    Given I am on the home page
    Then I should see "log_in" in selector "top_bar"
    And I should see "Sign Up" in selector "top_bar"
    

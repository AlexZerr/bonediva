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

  Scenario: view the home page
    Given I am on the home page
    Then I should see "Login" in selector "sidebar"
    And I should see "Email"
    And I should see "Password"
    And I should see "howdie doody"

    #Feature: veiwer creates a user
    #In order to create a user
    #as a viewer of the webpage
    #I want to be able to sign up

    #Scenario: view the form page

    

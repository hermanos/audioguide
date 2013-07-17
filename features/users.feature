Feature: Users management
	In order to manage the app content
  As a user
  I want to be able to manage my profile

  Scenario: Sign in as a user
    Given I am a user
    And I am signed out
    When I click sign in
    And I fill in my user credentials
    Then I should see "Welcome User"
    And I should see "Signed in successfully"

    
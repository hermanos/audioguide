Feature: Admin management
	In order to manage the app content
  As an administator
  I want to be able to manage museum info

  Scenario: Sign in as an admin
    Given I am an admin
    And I am signed out
    When I click sign in
    And I fill in my admin credentials
    Then I should see "Welcome Admin"
    And I should see "Signed in successfully"

    
Feature: Manage Users
	In order to make a user
	As an user
	I want to create and manage users
	
  Scenario: Users List
    Given I have users named Ishank, Jagdeep
    When I go to the list of users
    Then I should see "Ishank"
    And I should see "Jagdeep"

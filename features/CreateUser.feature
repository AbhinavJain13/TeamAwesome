Feature: Create new user account

Scenario: Loading registration page
  Given I am on the users page
  And I have clicked create new
  Then I should be redirected to the users/new page

Scenario: Register new user
  Given I am on the users/new page
  And I have filled in name and password
  Then I should be redirected to the streams page


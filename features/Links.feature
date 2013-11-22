Feature: Links from Team Awesome Home Page
  
Background:
  Given I have logged in with email "jayant-parchure@uiowa.edu" and password "jayantp"
  And I am on the Team Awesome Twitter App home page
  
Scenario: Twitter Link
  When I click on Twitter
  Then I should be taken to Twitter home page

Scenario: Logout
  When I click on Logout
  Then I should be logged out

Scenario: Retweets
  When I click on Retweets of Me
  Then I should see all my retweets

Scenario: UIowa Link
  When I click on University of Iowa
  Then I should be taken to Uiowa home page

Feature: View tweets from my Twitter account with their authors

  As a part of a Twitter marketing team
  So that I can see which tweets were authored by each team member
  I want to view tweets from my Twitter account with their authors

Background: I have logged in with email "example@email.com" and password "example"

Scenario: View tweets from my account with their authors 
  Given I am on the TeamAwesome homepage
  When I follow "Authored Tweets"
  Then I should see tweets with authors

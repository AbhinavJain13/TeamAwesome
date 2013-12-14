Feature: See my most popular tweets

	As a twitter user for marketing
	So that I can assess impact of my tweets
	I want to be able to see my Tweets that are most popular

Background: I have logged in with email "green@email.com" and password "greengreen"



Scenario: view all popular tweets associated with my account
  Given I am on the TeamAwesome homepage
  When I click on Popular Tweets 
  Then I should see all of my Popular tweets

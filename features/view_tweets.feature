Feature: view all the tweets associated with an account

	As a twitter user
	So that I can browse my tweets
	I want to be able to see my Twitter stream

Background: I have logged in

Scenario: view all tweets associated with my account
  When I am on the Team Awesome Twitter App home page
  Then I should see all my tweets
Feature: Login to Team Awesome

Given: I have one user with email "example@email.com" and password "password"
  
Scenario: 
  When I am on the users page
  Given I have filled in name and password
  Then I should be redirected to the streams page

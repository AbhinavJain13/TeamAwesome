== TEAM AWESOME TWITTER MANAGER


Hey Fellas,
We created this app in Fall 2013 as a project at the University of Iowa.
The Twitter Manager enables organizations who have multiple people managing their Twitter accounts to streamline their social media management. 
The app helps manage multiple user sessions associated with a single Twitter account accomplished using double layer authentication.
Once inside, not only can they see their stream but also keep a tab of which admin tweeted what. 
Some other features include 

=== Popular hashtags relevant to current user
Popular hashtags relevant to the current user are all hashtags currently trending on the user’s stream.  The feature uses a regular expression find all hashtags in the text of the tweets on the user’s stream.  It then presents a list of hashtags to the user, ranked by which hashtags appear the most frequently.  Clicking on any one hashtag takes the user to a new page, in which they see all of the tweets from their stream that use that hashtag.  The purpose of this feature is for a user to connect with those they follow by seeing what they are conversing about, and to ascertain whether or not hashtags they have initiated are being used by anyone they follow. 
=== Enabling private favoriting of tweets (Nicing)
If a user likes a tweets but he doesn't want it to favorite as a part of the twitter account, he can "Nice" it. Once again this feature has been designed in a way so as to keep a tab of which user "niced" which tweet. The benefit being that no one except the team knows which tweets have been favorited as they show up on the public stream
       
=== Letting admins post notes 
Useful for tweet follow ups or replies)

=== Pull out most popular tweets of current user
By popular we mean the tweets that have been favorited+retweeted most often. To accomplish this we fetched the number of times a tweet had been favorited or liked and then displayed it to the interface.

=== Identify users you follow who don’t follow you back 


The app was developed in Ruby on Rails with Twitter Bootsrap as the frontend. Postgresql was the database in development and moved to mysql for production. Tested using Rspec and cucumber.


Regards
---


==== Andrew, Audrey, Jay, Niraj



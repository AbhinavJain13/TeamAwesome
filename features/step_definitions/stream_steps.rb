# Completed step definitions for basic features: Login, Links, Tweets and Retweets

#Given /^I have logged in with email "(.*?)" and password "(.*?)"$/ do |email, pwd|
#  visit login_path
#  fill_in ('session[email]',  :with=> email)
#  fill_in('session[password]', :with=> pwd)
#  
#  click_on "Sign in"
  
#  assert true
#end

 When /^I am on the Team Awesome Twitter App home page$/ do
   visit streams_path
 end

 Then /^I should see all my tweets$/ do
   
#   all("td #id").each do |tr|
#    if !tr.has_content?
#      assert false
#      break
#    end
#  end  
#  assert true
# end
 end

 When /^I click on Logout$/ do
   click_on "Logout"
 end

 Then /^I should be logged out$/ do
   visit login_path
 end

 When /^I click on Twitter$/ do
   click_on "Twitter"
 end 
 Then /^I should be taken to Twitter home page$/ do
   visit "http://www.twitter.com"
 end
 When /^I click on University of Iowa$/ do
   click_on "University of Iowa"
 end
 Then /^I should be taken to Uiowa home page$/ do
   visit "http://www.uiowa.edu"
 end

 When /^I click on Retweets of Me$/ do
   click_on "Retweets Of Me"
 end
 Then /^I should see all my retweets$/ do
    visit new_stream_path
 end




 When /^I click on retweets of me button$/ do
      click_on "Retweets Of Me"
 end
 
 Then /^I should see all of my retweets$/ do
#     all("td #id").each do |tr|
#       if !(tr.has_content?)
#       assert false
#       break
#       end
#     end  
#   assert true
# end
 end

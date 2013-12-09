#The following two Given statements were written by "Doon" at Stack Overflow, http://stackoverflow.com/questions/3496500/cucumber-step-definition-for-given-that-im-logged-in

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |username,email, password|
  @user = User.new(:email => email,
                   :username=>username,
                   :password => password,
                   :password_confirmation => password)
   @user.save!
end

Given /^I am an authenticated user$/ do
  name = 'example'
  email = 'example@example.com'
  password = 'secret!'

  Given %{I have one user "#{name}" with email "#{email}" and password "#{password}"}
  And %{I go to the user login page}
  And %{I fill in "user_username" with "#{name}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

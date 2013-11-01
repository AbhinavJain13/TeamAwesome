require 'spec_helper'

describe UsersController do
  describe 'create new user' do
    it 'should call the model method that creates new users given valid data' do
      @fake_data = {:user => {'name'=>'Mr. Magoo', 'password1'=>'horse', 'password2'=>'horse'}}
      User.should_receive(:create_user).with({'name'=>'Mr. Magoo', 'password1'=>'horse', 'password2'=>'horse'})
      post :add_user, @fake_data
    end
    #it 'should show a flash message given invalid data'
    #it 'should redirect to streams on successful creation'
  end
end

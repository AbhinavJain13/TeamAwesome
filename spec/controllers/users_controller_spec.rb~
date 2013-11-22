require 'spec_helper'

describe UsersController do
  describe 'create new user' do
    it 'should call the model methods that create a new user' do
      fake_data = {:user=>{'name'=>'Miles Magoo', 'email'=>'magoo@email.com', 'password'=>'horse44', 'password_confirmation'=>'horse44'}}
      fake_obj = double()
      User.should_receive(:new).with(fake_data[:user]).and_return(fake_obj)
      fake_obj.should_receive(:save)
      post :create, fake_data
    end
    it 'should show flash message if User.save is successful' do
      fake_data = {:user=>{'name'=>'Miles Magoo', 'email'=>'magoo@email.com', 'password'=>'horse44', 'password_confirmation'=>'horse44'}}
      fake_obj = double()
      User.should_receive(:new).with(fake_data[:user]).and_return(fake_obj)
      fake_obj.should_receive(:save).and_return('true')
      flash[:notice].should == 'Welcome!'
      post :create, fake_data
    end
    it 'should redirect to streams on successful creation' 
    it 'should rerender user/new if User.save is unsuccessful' 
  end
end

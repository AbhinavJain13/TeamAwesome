require 'spec_helper'

describe UsersController do
  describe 'create new user' do
    it 'should call the model method that creates new users given valid data' do
      @fake_data = {:user => {'name'=>'Mr. Magoo', 'email' => 'mrmagoo@yahoo.com', 'password'=>'horse', 'password_confirmation'=>'horse'}}
      @fake_results = double('new_user') 
      User.any_instance.stub(:save)
      User.should_receive(:new).with({'name'=>'Mr. Magoo', 'email' => 'mrmagoo@yahoo.com', 'password'=>'horse', 'password_confirmation'=>'horse'}).and_return(@fake_results)
      
      post :create, @fake_data
    end
    it 'should show flash message if User.save is successful' do
      #@fake_data = {:user => {'name'=>'Mr. Magoo', 'email' => 'mrmagoo@yahoo.com', 'password'=>'horse', 'password_confirmation'=>'horse'}}
      @fake_results = double('user') 
      #@fake_results.stub(:save) {true}
      User.stub(:new) {@fake_results}
      assigns(:user).should == @fake_results
      User.any_instance.stub(:save).and_return(true)
      #User.should_receive(:new).and_return(@fake_results) 
      #assigns(:user).should == @fake_results    
      #@fake_results.should_receive(:save).and_return(true)
      
      #flash[:notice].should == 'Welcome!'
      post :create
    end
    it 'should show flash message if User.save is unsuccessful' do
     # User.stub(:new)
     # User.should_receive(:save).and_return(false)
     # flash[:notice].should == 'There was an error creating your account.'
     # response.should render_template('create') 
    end
    it 'should show a flash message given a blank name field' do
      post :create, {:user => {'name' => '', 'email' => 'mrmagoo@yahoo.com', 'password'=> 'ab', 'password_confirmation'=>'ab'}}
      flash[:notice].should == 'Please fill out each field of the form.'
      response.should render_template('create')
    end
    it 'should show a flash message given a blank email field' do
      post :create, {:user => {'name' => 'Mr. Magoo', 'email' => '', 'password'=> 'ab', 'password_confirmation'=>'ab'}}
      flash[:notice].should == 'Please fill out each field of the form.'
      response.should render_template('create')
    end
    it 'should show a flash message given a blank password field' do
      post :create, {:user => {'name' => 'ac', 'email' => 'mrmagoo@yahoo.com', 'password'=> '', 'password_confirmation'=>'ab'}}
      flash[:notice].should == 'Please fill out each field of the form.'
      response.should render_template('create')
    end
    it 'should show a flash message given a blank password_confirm field' do
      post :create, {:user => {'name' => 'ac', 'email' => 'mrmagoo@yahoo.com', 'password'=> 'ab', 'password_confirmation'=>''}}
      flash[:notice].should == 'Please fill out each field of the form.'
      response.should render_template('create')
    end
    it 'should redirect to streams on successful creation' do
       User.stub(:new)
       User.should_receive(:save).and_return(true)
       post :create, {:user => {'name' => 'ac', 'email' => 'mrmagoo@yahoo.com', 'password'=> 'ab', 'password_confirmation'=>'ab'}}
       response.should redirect_to('/streams')
    end
    
  end
end

require 'spec_helper'

describe SessionsController do

  describe 'logging in' do
    it 'should check the database for existing email' do
      User.should_receive(:find_by_email).with('email@address.com')
      post :create
    end
    it 'should authenticate by name and password' do
    end
    describe 'correct name/password combination' do
      it 'should assign session token' do
      end
      it 'should assign current user' do
      end
      it 'should redirect to streams' do
      end
    end
    describe 'incorrect name/password combination' do
      it 'should show flash message' do
      end
      it 'should render new' do
      end
    end
  end
end

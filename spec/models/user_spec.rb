require 'spec_helper'

describe User do
  describe 'leaving blank field' do 
    it 'name should produce a cant be blank error' do
    
      subject.name.should be_blank
      subject.valid?
   # subject.should have(1).error_on(:name)
      subject.errors[:name].should == ["can't be blank"]
    end
     it 'email should produce cant be blank and invalid errors' do   
      subject.email.should be_blank
      subject.valid?
      
      subject.errors[:email].should == ["can't be blank", "is invalid"]
    end
     it "password should produce blank and too short errors" do   
      subject.password.should be_blank
      subject.valid?
      subject.errors[:password].should == ["can't be blank", "is too short (minimum is 6 characters)"]
  
    end
    it "password_confirmation should produce can't be blank error" do   
      subject.password.should be_blank
      subject.valid?
      subject.errors[:password_confirmation].should == ["can't be blank"]
    
    end
  end
end

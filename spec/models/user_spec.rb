require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do 
      @user = User.new({email: "test@test.com",
      password: "testpassword",
      password_confirmation: "testpassword",
      first_name: "Bob",
      last_name: "Smith"})
    end

    it 'should create a user when all fields are filled out' do
      expect(@user).to be_valid
    end

    it 'should prevent a user from being created if password and password_confirmation are not identical' do
      @user.password_confirmation = "testpassword1"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should prevent a user from being created if password is empty' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'should prevent a user from being created if password is less than 6 characters' do
      @user.password = "short"
      @user.password_confirmation = "short"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'should prevent a user from being created if email is not given' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
   
    it 'should prevent a user from being created if first name is not given' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'should prevent a user from being created if last name is not given' do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should prevent a user from being create if a user with the same email is already present in the database' do
      @user.save
      @user2 = @user.dup
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'should prevent a user from being create if a user with the same email (case insensitive) is already present in the database' do
      @user.save
      @user2 = @user.dup
      @user2.email = "TEST@test.com"
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
end

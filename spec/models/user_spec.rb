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

    it 'should prevent a user from being created if password and password_confirmation are not identical' do
      @user.password_confirmation = "testpassword1"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should prevent a user from being created if password is empty' do
      @user.password = nil
      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("dfgfg")
    end
  end
end

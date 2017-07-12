require 'rails_helper'

  describe User do
    context 'user validate' do

      it 'should not validate without email' do
        @user = FactoryGirl.build(:user, email: "")
        expect(@user).not_to be_valid
      end

      it 'should not validate without VALID email' do
        @user = FactoryGirl.build(:user, email: "noemail")
        expect(@user).not_to be_valid
      end

      it 'should not validate without password' do
        @user = FactoryGirl.build(:user, password: "")
        expect(@user).not_to be_valid
      end

      it 'should validate user with valid email and password' do
        @user = FactoryGirl.build(:user)
        expect(@user).to be_valid
      end
    end
  end

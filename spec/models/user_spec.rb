require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    before :each do
      @valid_user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example@jungle.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_no_first_name = User.create(
        first_name: nil,
        last_name: 'Doe',
        email: 'example1@jungle.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_no_last_name = User.create(
        first_name: 'John',
        last_name: nil,
        email: 'example2@jungle.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_no_email = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_no_password = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example3@jungle.com',
        password: nil,
        password_confirmation: '1234567'
      )
      @user_no_password_confirmation = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example4@jungle.com',
        password: '1234567',
        password_confirmation: nil
      )
      @user_existing_email = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example@jungle.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_existing_email_caps = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'EXAMPLE@jungle.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      @user_confirmation_not_equal = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example5@jungle.com',
        password: '1234567',
        password_confirmation: '123456'
      )
      @user_password_too_short = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example5@jungle.com',
        password: '1234',
        password_confirmation: '1234'
      )
      @user_password_too_long = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'example5@jungle.com',
        password: '12345678901234567',
        password_confirmation: '12345678901234567'
      )
    end

    it 'are valid with all valid attributes' do
      expect(@valid_user).to be_valid
    end

    it 'are not valid with missing first name' do
      expect(@user_no_first_name.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'are not valid with missing last name' do
      expect(@user_no_last_name.errors.full_messages).to include("Last name can't be blank")
    end

    it 'are not valid with missing email' do
      expect(@user_no_email.errors.full_messages).to include("Email can't be blank")
    end

    it 'are not valid with missing password' do
      expect(@user_no_password.errors.full_messages).to include("Password can't be blank")
    end

    it 'are not valid with missing password confirmation' do
      expect(@user_no_password_confirmation.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'are not valid with an existing email' do
      expect(@user_existing_email.errors.full_messages).to include("Email has already been taken")
    end

    it 'are not valid with an existing email in caps' do
      expect(@user_existing_email_caps.errors.full_messages).to include("Email has already been taken")
    end

    it 'are not valid if password and password confirmation is not equal' do
      expect(@user_confirmation_not_equal.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'are not valid if password is too short' do
      expect(@user_password_too_short.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it 'are not valid if password is too long' do
      expect(@user_password_too_long.errors.full_messages).to include("Password is too long (maximum is 16 characters)")
    end
  end
end

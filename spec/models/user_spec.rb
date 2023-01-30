require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it "The user has everything" do
      @user = User.new(name: "Mister Popo", password: "popo", password_confirmation:"popo", email: "mister@popo.com")
      
      @user.save

      expect(@user).to be_valid
    end

    it "throw error if name is not present" do
      @user = User.new(name: nil, password: "popo", password_confirmation:"popo", email: "mister@popo.com")
      
      @user.save

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("Name can't be blank")

    end

    it "throw error if password is not present" do
      @user = User.new(name: "Mister popo", password: nil, password_confirmation:"popo", email: "mister@popo.com")
      
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")

    end

    it "throw error if password_confirmation is not present" do
      @user = User.new(name: "Mister popo", password: "popo", password_confirmation: nil, email: "mister@popo.com")
      
      @user.save

      expect(@user).to_not be_valid
    end

    it "throw error if password_confirmation is not the same as password" do
      @user = User.new(name: "Mister popo", password: "popo", password_confirmation: "opop", email: "mister@popo.com")
      
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "throw error if email is not present" do
      @user = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: nil)
      
      @user.save

      expect(@user.errors.full_messages).to include("Email can't be blank")

    end

    it "throw error if email exists in the database" do
      @user = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: "tristanjacobs@gmail.com")

      @user2 = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: "TristanJacobs@gmail.com")
      
      @user.save
      @user2.save

      expect(@user2).to_not be_valid
      # expect(@user.errors.full_messages).to include("Email alre")

    end

    it "password should have minimum length" do
      @user = User.new(name: "Mister popo", password: "pop", password_confirmation: "pop", email: "tristanjacobs@gmail.com")
      
      @user.save

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("Email alre")

    end

  end

  describe '.authenticate with credentials' do
    it 'should pass when correct e-mail and password are given' do
      @user = User.new(name: "Mister popo", password: "password", password_confirmation: "password", email: "tristanjacobs@gmail.com")
      @user.save

      @login_instance = User.authenticate_with_credentials("tristanjacobs@gmail.com", "password")

      expect(@login_instance.email).to eq (@user.email)
    end

    it 'should fail when wrong e-mail is given' do
      @user = User.new(name: "Mister popo", password: "password", password_confirmation: "password", email: "tristanjacobs@gmail.com")
      @user.save

      @login_instance = User.authenticate_with_credentials("tristanjacobsrox@gmail.com", "password")
      
      expect(@login_instance).to be_nil
    end

    it 'should fail when wrong password is given' do
      @user = User.new(name: "Mister popo", password: "password", password_confirmation: "password", email: "tristanjacobs@gmail.com")
      @user.save

      @login_instance = User.authenticate_with_credentials("tristanjacobs@gmail.com", "password123")
      
      expect(@login_instance).to be_nil
    end

    it 'should pass when e-mail of different case is given' do
      @user = User.new(name: "Mister popo", password: "password", password_confirmation: "password", email: "tristanjacobs@gmail.com")
      @user.save

      @login_instance = User.authenticate_with_credentials("TristanJacobs@gmail.com", "password")
      
      expect(@login_instance.email).to eq (@user.email)
    end

    it 'should pass when e-mail is given with whitespace' do
      @user = User.new(name: "Mister popo", password: "password", password_confirmation: "password", email: "tristanjacobs@gmail.com")
      @user.save

      @login_instance = User.authenticate_with_credentials(" TristanJacobs@gmail.com ", "password")
      
      expect(@login_instance.email).to eq (@user.email)
    end
  end
end

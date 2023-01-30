require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it "The user has everything" do
      @users = User.new(name: "Mister Popo", password: "popo", password_confirmation:"popo", email: "mister@popo.com")
      
      @users.save

      expect(@users).to be_valid
    end

    it "throw error if name is not present" do
      @users = User.new(name: nil, password: "popo", password_confirmation:"popo", email: "mister@popo.com")
      
      @users.save

      expect(@users).to_not be_valid
      # expect(@users.errors.full_messages).to include("Name can't be blank")

    end

    it "throw error if password is not present" do
      @users = User.new(name: "Mister popo", password: nil, password_confirmation:"popo", email: "mister@popo.com")
      
      @users.save

      expect(@users.errors.full_messages).to include("Password can't be blank")

    end

    it "throw error if password_confirmation is not present" do
      @users = User.new(name: "Mister popo", password: "popo", password_confirmation: nil, email: "mister@popo.com")
      
      @users.save

      expect(@users).to_not be_valid
    end

    it "throw error if password_confirmation is not the same as password" do
      @users = User.new(name: "Mister popo", password: "popo", password_confirmation: "opop", email: "mister@popo.com")
      
      @users.save

      expect(@users.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "throw error if email is not present" do
      @users = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: nil)
      
      @users.save

      expect(@users.errors.full_messages).to include("Email can't be blank")

    end

    it "throw error if email exists in the database" do
      @users = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: "tristanjacobs@gmail.com")

      @users2 = User.new(name: "Mister popo", password: "popo", password_confirmation: "popo", email: "TristanJacobs@gmail.com")
      
      @users.save
      @users2.save

      expect(@users2).to_not be_valid
      # expect(@users.errors.full_messages).to include("Email alre")

    end

    it "password should have minimum length" do
      @users = User.new(name: "Mister popo", password: "pop", password_confirmation: "pop", email: "tristanjacobs@gmail.com")
      
      @users.save

      expect(@users).to_not be_valid
      # expect(@users.errors.full_messages).to include("Email alre")

    end

  end
end

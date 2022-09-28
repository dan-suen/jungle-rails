require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates email field" do
      @user = User.create({
        first_name:  "Lion",
        last_name: "Grapevine",
        password: "password",
        password_confirmation: "password",
        email: nil
      })
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "validates first name field" do
      @user = User.create({
        first_name:  nil,
        last_name: "Grapevine",
        password: "password",
        password_confirmation: "password",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "validates last name field" do
      @user = User.create({
        first_name: "Lion",
        last_name: nil,
        password: "password",
        password_confirmation: "password",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "validates password field" do
      @user = User.create({
        first_name: "Lion",
        last_name: "Grapevine",
        password: nil,
        password_confirmation: "padsfdsord",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "validates password_confirmation field" do
      @user = User.create({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "password",
        password_confirmation: nil,
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "validates password field is the same as password_confirmation field" do
      @user = User.create({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "password",
        password_confirmation: "padsfdsord",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "validates unique email field" do
      @user = User.create({
        first_name:  "Lion",
        last_name: "Grapevine",
        password: "password",
        password_confirmation: "password",
        email: "apple@com"
      })
      @user1 = User.create({
        first_name:  "Lion",
        last_name: "Grapevine",
        password: "password",
        password_confirmation: "password",
        email: "Apple@com"
      })
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end
    it "validates password has minimum length" do
      @user = User.create({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "passd",
        password_confirmation: "passd",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it "validates email and password" do
        User.create({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "passdsdfs",
        password_confirmation: "passdsdfs",
        email: "apple@com"
      })
        User.create({
        first_name: "Lsddion",
        last_name: "Grapevine",
        password: "passdsdfs",
        password_confirmation: "passdsdfs",
        email: "appple@com"
      })
      result = User.authenticate_with_credentials("appple@com", "passdsdfs")
      expect(result).to have_attributes(first_name: "Lsddion", last_name: "Grapevine", email: "appple@com")
    end
    it "validates email ignoring case" do
      User.create!({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "passdsdfs",
        password_confirmation: "passdsdfs",
        email: "apple@COM"
      })
      result = User.authenticate_with_credentials("aPple@com", "passdsdfs")
      expect(result).to have_attributes(first_name: "Lion", last_name: "Grapevine", email: "apple@COM")
    end
    it "validates email ignoring spaces" do
      User.create!({
        first_name: "Lion",
        last_name: "Grapevine",
        password: "passdsdfs",
        password_confirmation: "passdsdfs",
        email: "apple@com"
      })
      result = User.authenticate_with_credentials(" apple@com ", "passdsdfs")
      expect(result).to have_attributes(first_name: "Lion", last_name: "Grapevine", email: "apple@com")
    end
  end
end

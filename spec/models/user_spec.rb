require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates email field" do
      @user = User.create({
        name:  'Lion Grapevine',
        password: "password",
        email: nil
      })
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "validates name fields" do
      @user = User.create({
        name: nil,
        password: "password",
        email: "apple@com"
      })
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end
end

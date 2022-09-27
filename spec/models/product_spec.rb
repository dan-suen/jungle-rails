require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves fields correctly" do
      @product = Product.create({
        name:  'Lion Grapevine',
        quantity: 4,
        price: 34.49,
        category: (Category.find_or_create_by! name: 'Evergreens')
      })
      expect(@product).to be_valid
    end
    it "validates name field" do
      @product = Product.create({
        name:  nil,
        quantity: 4,
        price: 34.49,
        category: (Category.find_or_create_by! name: 'Evergreens')
      })
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "validates price field" do
      @product = Product.create({
        name:  'Lion Grapevine',
        quantity: 4,
        category: (Category.find_or_create_by! name: 'Evergreens')
      })
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "validates quantity field" do
      @product = Product.create({
        name:  'Lion Grapevine',
        quantity: nil,
        price: 34.49,
        category: (Category.find_or_create_by! name: 'Evergreens')
      })
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "validates category field" do
      @product = Product.create({
        name:  'Lion Grapevine',
        quantity: 4,
        price: 34.49,
        category: nil
      })
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

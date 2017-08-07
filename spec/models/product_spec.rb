require 'rails_helper'
require 'pry'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'are valid with valid attributes' do
      @category = Category.create(name: 'test')
      @product  = Product.create(
        name: 'sunglasses', 
        price_cents: '3499', 
        quantity: '10', 
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'are not valid with missing name attribute' do
      @category = Category.create(name: 'test')
      @product  = Product.create(
        name: nil, 
        price_cents: '3499', 
        quantity: '10', 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'are not valid with missing price attribute' do
      @category = Category.create(name: 'test')
      @product  = Product.create(
        name: 'sunglasses', 
        price_cents: nil, 
        quantity: '10', 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'are not valid with missing quantity attribute' do
      @category = Category.create(name: 'test')
      @product  = Product.create(
        name: 'sunglasses', 
        price_cents: '3499', 
        quantity: nil, 
        category: @category
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'are not valid with missing catergory attribute' do
      @category = Category.create(name: 'test')
      @product  = Product.create(
        name: 'sunglasses', 
        price_cents: '3499', 
        quantity: '10', 
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
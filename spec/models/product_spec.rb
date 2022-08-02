require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'Product saves successfully given arguments' do
      category = Category.find_or_create_by name: 'household'
      product = category.products.create({
        name: 'Ivy',
        price: 150,
        quantity: 1,
      })

      product_saved = product.save
      expect(product_saved).to be_truthy

    end
    
    
    it 'is not valid without a name' do
      category = Category.find_or_create_by name: 'household'
      product = category.products.create({
        name: nil,
        price: 150,
        quantity: 1,
      })
      expect(product).to_not be_valid

    end

    it 'is not valid without a price' do
      category = Category.find_or_create_by name: 'household'
      product = category.products.create({
        name: 'Ivy',
        quantity: 1,
      })
      expect(product).to_not be_valid

    end

    it 'is not valid without a quantity' do
      category = Category.find_or_create_by name: 'household'
      product = category.products.create({
        name: 'Ivy',
        price: 150,
        quantity: nil,
      })
      expect(product).to_not be_valid

    end

    it 'is not valid without a category' do
      product = Product.new({
        name: 'Ivy',
        price: 150,
        quantity: 1,
        category: nil,
      })
      expect(product).to_not be_valid

    end
  
  end
end
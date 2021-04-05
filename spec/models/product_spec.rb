require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     it 'should create a product when all fields are filled out' do
#       @category = Category.new(name: "Tests")
#       @product = Product.new(name: "Test product",
#                             price_cents: 1000,
#                             quantity: 99,
#                             :category => @category
#                             )
#       expect(@product).to be_valid
#     end

#     it 'should prevent a product from being created if the name field is empty' do
#       @category = Category.new(name:"Tests")
#       @product = Product.new(name: nil,
#                             price_cents: 1000,
#                             quantity: 99,
#                             :category => @category)
#       expect(@product).to_not be_valid
#       expect(@product.errors[:name]).to include("can't be blank")
#     end
    
#     it 'should prevent a product from being created if the price field is empty' do
#       @category = Category.new(name:"Tests")
#       @product = Product.new(name: "Test product",
#                             price_cents: nil,
#                             quantity: 99,
#                             :category => @category)
#       expect(@product).to_not be_valid
#       expect(@product.errors[:price_cents]).to include("is not a number")
#     end
    
#     it 'should prevent a product from being created if the quantity field is empty' do
#       @category = Category.new(name:"Tests")
#       @product = Product.new(name: "Test product",
#                             price_cents: 1000,
#                             quantity: nil,
#                             :category => @category)

#       expect(@product).to_not be_valid
#       expect(@product.errors[:quantity]).to include("can't be blank")
#     end
    
#     it 'should prevent a product from being created if the category field is empty' do
#       @category = Category.new(name:"Tests")
#       @product = Product.new(name: "Test product",
#                             price_cents: 1000,
#                             quantity: 1000,
#                             :category => nil)

#       expect(@product).to_not be_valid
#       expect(@product.errors[:category]).to include("can't be blank")
#     end
    

#   end
# end

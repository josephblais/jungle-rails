require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see their cart quantity increase by one when Add To Cart is clicked" do
    visit root_path
    save_screenshot('AddToCartBefore.png')
    first('button.btn-primary').click
    expect(page).to have_link 'My Cart (1)'
    save_screenshot('AddToCartAfter.png')
  end
end

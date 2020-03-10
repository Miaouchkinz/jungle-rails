require 'rails_helper'

RSpec.feature "Visitor can add a product to cart", type: :feature, js: true do
  # SETUP
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


  scenario "They can add a product to their cart and the cart count will update" do
    # ACT
    visit root_path

    within '.product', match: :first do
      click_button 'Add'
      # DEBUG
      save_screenshot('clicked-add-to-cart.png')
    end
  

    # VERIFY
    within('nav') { expect(page).to have_content 'My Cart (1)'}
  end
end

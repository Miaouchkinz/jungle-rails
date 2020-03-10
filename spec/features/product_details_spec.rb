require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do
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


  scenario "They can navigate to the product detail page by clicking on a product" do
    # ACT
    visit root_path

    within '.product', match: :first do
      click_link 'Details »'
    end

    # DEBUG
    save_screenshot('selected_product_page.png')

    # VERIFY
    expect(page).to have_css 'section.products-show', count: 1
  end
end

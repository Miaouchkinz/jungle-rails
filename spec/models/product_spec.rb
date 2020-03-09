require 'rails_helper'

# Each example will needs its own @category created and then 
# @product initialized with that category
RSpec.describe Product, type: :model do
  subject {
    Product.new(name: 'the best book', price: 10, quantity: 4, category: Category.new)
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    # validates :name, presence: true
    it "is not valid without a name" do
    end
    # validates :price, presence: true
    it "is not valid without a price" do
    end
    # validates :quantity, presence: true
    it "is not valid without a quantity" do
    end
    # validates :category, presence: true
    it "is not valid without a category" do
    end
  end
end

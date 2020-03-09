require 'rails_helper'

# Each example will needs its own @category created and then 
# @product initialized with that category
RSpec.describe Product, type: :model do
  subject {
    Product.new(name: 'the best book', price_cents: 10, quantity: 4, category: Category.new)
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
 
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end

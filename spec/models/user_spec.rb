require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid when password and password confirmation match" do
      user = User.new name: 'Tiny Tim', email: 'tinytim@xmas.ca', password: 'pass123', password_confirmation: 'pass123'
      expect(user).to be_valid
    end

    it "is not valid when password and password confirmation do not match" do
      user = User.new name: 'Tiny Tim', email: 'tinytim@xmas.ca', password: 'pass123', password_confirmation: 'pass321'
      expect(user).to_not be_valid
    end

    it "is valid when emails is unique (not case sensitive)" do
      user1 = User.new name: 'Tiny Tim', email: 'tinytim@xmas.ca', password: 'pass123', password_confirmation: 'pass123'
      user2 = User.new name: 'Mother Mary', email: 'TiNyTiM@XMAS.ca', password: 'pass123', password_confirmation: 'pass123'
      user1.save
      expect(user2).to_not be_valid
    end

    it "is not valid when email is blank" do
      user = User.new name: 'Tiny Tim', email: '', password: 'pass123', password_confirmation: 'pass321'
      expect(user).to_not be_valid
    end

    it "is not valid when name is blank" do
      user = User.new name: '', email: 'tinytim@xmas.ca', password: 'pass123', password_confirmation: 'pass321'
      expect(user).to_not be_valid
    end

    it "is not valid when password is under 3 characters" do
      user = User.new name: 'Tiny Tim', email: 'tinytim@xmas.ca', password: '12', password_confirmation: '12'
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    subject {
      User.create(name: 'Tiny Tim', email: 'tinytim@xmas.ca', password: 'pass123', password_confirmation: 'pass123')
    }

    it "validates a user with given credentials" do
      authenticated_user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(authenticated_user).to eq(subject)
    end

    it "finds the correct user with a differently-cased email" do
      authenticated_user = User.authenticate_with_credentials(subject.email.upcase, subject.password)
      expect(authenticated_user).to eq(subject)
    end

    it "trims whitespace around email" do
      authenticated_user = User.authenticate_with_credentials("   #{subject.email}   ", subject.password)
      expect(authenticated_user).to eq(subject)
    end

    it "returns nil when given invalid credentials" do
      authenticated_user = User.authenticate_with_credentials('harry@griffindor.com', 'hermione4ever')
      expect(authenticated_user).to eq(nil)
    end
  end

end

class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :name, presence: true
  validates :password, length: { minimum: 3 }
  
  before_save do
    self.email = email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email email.strip.downcase
    return user if user && user.authenticate(password)
    
    nil
  end
end

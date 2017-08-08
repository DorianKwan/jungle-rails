require 'pry'
class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 5..16  }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials email, password
    user = User.find_by_email(email.strip.downcase)
    puts user.inspect
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
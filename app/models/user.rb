class User < ApplicationRecord
  has_secure_password

  has_many :articles, dependent: :destroy

  validates_presence_of :email, :username, :password
  validates :email, uniqueness: true, email_format: { message: "Doesn't look like an email address" } 
  validates :password, length: { minimum: 5 }
end

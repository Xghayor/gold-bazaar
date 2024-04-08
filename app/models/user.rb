class User < ApplicationRecord
    has_secure_password
    has_many :orders

    validates :username, presence: true, uniqueness: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true, length: { minimum: 6 }
end

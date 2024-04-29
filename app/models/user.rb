class User < ApplicationRecord
    before_create :generate_api_key

    has_secure_password
    has_many :orders

    validates :username, presence: true, uniqueness: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true, length: { minimum: 6 }

    private
    def generate_api_key
        self.api_key = SecureRandom.hex(16)
    end
end

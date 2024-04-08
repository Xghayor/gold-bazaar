class Order < ApplicationRecord
  belongs_to :user

  validates :shippingaddress, presence: true
  validates :orderstatus, presence: true
  validates :user, presence: true
end

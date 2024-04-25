class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_details

  validates :shippingaddress, presence: true
  validates :orderstatus, presence: true
  validates :user, presence: true

  after_create :set_default_orderstatus

  private

  def set_default_orderstatus
    self.orderstatus = 'pending'
  end
end
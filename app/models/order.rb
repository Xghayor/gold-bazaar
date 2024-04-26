class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_details

  validates :shippingaddress, presence: true
  validates :orderstatus, presence: true
  validates :user, presence: true

  public

  def check_order_status
    update_column(:orderstatus, 'completed')
  end
end

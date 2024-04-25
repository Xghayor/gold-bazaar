class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unitprice, presence: true, numericality: { greater_than: 0.0 }
  validates :product, presence: true
  validates :order, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0.0 }

  after_create :update_order_status

  def total_amount
    quantity * unitprice
  end

  private

  def update_order_status
    self.order.update(:orderstatus, "Completed")
  end
end
class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  belongs_to :order_status
  before_create :set_order_status

  private
  def set_order_status
    self.order_status_id = 1
  end


end

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  has_many :order_items

  before_create :set_order_status

  def subtotal
    order_items.collect {|oi| oi.valid? ? (oi.quantity * oi.unit_price) : O}.sum
  end

  def total_weight
    order_items.collect {|oi| oi.valid? ? (Product.find(oi.id).weight*oi.quantity) : 0}.sum
  end

  def shipping_price
    if total_weight >= 1000
      250
    elsif (total_weight < 1000) && (total_weight > 500)
      120
    else
      50
    end
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  #TODO
  def update_subtotal
    self[:subtotal] = subtotal
  end
end

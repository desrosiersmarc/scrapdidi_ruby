class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  has_many :order_items

  validates :cgv, acceptance: {message: "Veuillez accepter les conditions générales de ventes"}
  #validates :customer_message, presence: true

  before_create :set_order_status

  def subtotal
    order_items.collect {|oi| oi.valid? ? (oi.quantity * oi.unit_price) : O}.sum
  end

  def total_weight
    order_items.collect {|oi| oi.valid? ? (Product.find(oi.product_id).weight*oi.quantity) : 0}.sum
  end

  def shipping_price
    if !self.delivery_id.nil?
      (Delivery.all.where("min_weight < ?", total_weight)
                                .where("? <= max_weight", total_weight)
                                .where("name = ?", order_delivery_name)
                                .first
                                .price) * 100
    else
      0
    end
  end

  def order_delivery_name
    Delivery.find(self.delivery_id).name
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

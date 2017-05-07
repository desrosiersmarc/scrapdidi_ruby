class PaymentsController < ApplicationController
  before_action :set_order
  def new
    @order_items = current_order.order_items
    @class_hidden = "hidden"
  end

def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.total_price_cents, # or amount_pennies
    description:  "Scrapdidi payment for order #{@order.id}",
    currency:     @order.total_price.currency
  )

  @order.update(payment: charge.to_json, state: 2)
  redirect_to order_path(@order)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)
end

private
  def set_order
    @order = Order.where(order_status_id: 1).find(params[:order_id])
  end
end

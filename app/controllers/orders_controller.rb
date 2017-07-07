class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :update]
  before_action :find_order, only: [:show, :edit, :update]
  before_action :weight_and_deliveries, only: [:edit, :update]

  def show
    # @order = Order.where(order_status_id: 2).find(params[:id])
    @order = Order.find(1023)
  end

  def index
    @order_in_progress = Order.all.where(order_status_id: 1)
    @order_payed = Order.all.where(order_status_id: 2)
    @order_in_preparation = Order.all.where(order_status_id: 3)
    @order_shipped = Order.all.where(order_status_id: 4)
    @order_pending = Order.all.where(order_status_id: 5)

    render :layout => "my_layout"
    #TODO
    #@order_pending = Order.all.where(order_status_id: 1)
  end

  def edit
    @current_id = current_user.id
  end

  def update
    @order.total_price = @order.total_price_calculated / 100
    if @order.update(params_order)
      redirect_to new_order_payment_path(@order)
    else
      render :edit, notice: "Il y a un problème"
    end
  end

  private
    def find_order
      @order = Order.find(current_order.id)
    end

    def weight_and_deliveries
      @weight = current_order.total_weight
      @deliveries = Delivery.all.where("min_weight < ?", @weight)
                                .where("? <= max_weight", @weight)
    end

    def params_order
      params["order"]["delivery_id"] = params["shippingSelected"].to_i
      params.require(:order).permit(:delivery_id, :customer_message, :cgv, :total_price, :user_id, :payment_type )
    end
end

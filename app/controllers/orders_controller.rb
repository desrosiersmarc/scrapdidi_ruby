class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :update]
  before_action :find_order, only: [:show, :edit, :update]
  before_action :weight_and_deliveries, only: [:edit, :update]

  def show
    @order = Order.where(order_status_id: 2).find(params[:id])
  end

  def index
    # @order_pending = Order.all.where(order_status_id: 1)
    @order_in_progress = Order.all.where(order_status_id: 1)
    @order_payed = Order.all.where(order_status_id: 2)
    @order_in_preparation = Order.all.where(order_status_id: 3)
    @order_shipped = Order.all.where(order_status_id: 4)
    @order_pending = Order.all.where(order_status_id: 5)

    render :layout => "my_layout"
    #TODO
  end

  def edit
    @current_id = current_user.id
  end

  def update

    @order.total_price = @order.total_price_calculated / 100
    @order.delivery_id = params["shippingSelected"].to_i if params["shippingSelected"]
    if @order.update(params_order)
        if @order.order_status_id == 1
          redirect_to new_order_payment_path(@order)
        end
    else
      render :edit, notice: "Il y a un problème"
    end
  end

  private
    def find_order
      # @order = Order.find(current_order.id)
      @order = Order.find(params[:id])
    end

    def weight_and_deliveries
      @weight = current_order.total_weight
      @deliveries = Delivery.all.where("min_weight < ?", @weight)
                                .where("? <= max_weight", @weight)
    end

    def params_order

      # params["order"]["delivery_id"] = params["shippingSelected"].to_i if params["shippingSelected"]


      params.require(:order).permit(:delivery_id,
                                    :customer_message,
                                    :cgv,
                                    :total_price,
                                    :user_id,
                                    :payment_type,
                                    :order_status_id )
    end
end

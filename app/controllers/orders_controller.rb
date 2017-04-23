class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :find_order, only: [:show, :edit, :update]
  before_action :weight_and_deliveries, only: [:edit, :update]
  def show
  end

  def edit
  end

  def update
    if @order.update(params_order)
      redirect_to root_path, notice: "Votre commande est validée"
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
      #params["order"]["delivery_id"] = params["shippingSelected"].to_i
      params.require(:order).permit(:delivery_id, :customer_message, :cgv )
    end
end

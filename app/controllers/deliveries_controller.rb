class DeliveriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @weight = current_order.total_weight
    @deliveries = Delivery.all.where("min_weight < ?", @weight).where("? <= max_weight", @weight)
  end
end

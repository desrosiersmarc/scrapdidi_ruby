class DeliveriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @order = current_order
    @weight = current_order.total_weight
    @deliveries = Delivery.all.where("min_weight < ?", @weight)
                              .where("? <= max_weight", @weight)

    #url = "https://api.laposte.fr/tarifenvoi/v1?type=lettresuivi&poids=" + @weight.to_s
    #api_key = 'aTRdlP5x7MxqkXsEuRQQ4FMXT/PXdvk4C/sq4utixtFM8VYdx1v2mzVP3TAv5G43'
    #json_string = RestClient::Request.execute(method: :get,
    #                              url: url,
    #                              headers: { 'X-Okapi-Key': api_key }).body
    #@deliveries_json = JSON.parse(json_string)
  end
end

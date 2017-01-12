class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :soon ]

  def home
    @products = Product.where("home = ?", "yes")
    @products_new = @products.where("state = ?", "new")
    @products_promotion = @products.where("state = ?", "promotion")
    @products_topsell = @products.where("state = ?", "topsell")
  end

end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :soon ]

  def home
    @products = Product.where("home = ?", "yes")
  end
  def soon
  end
end

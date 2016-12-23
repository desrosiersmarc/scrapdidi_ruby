class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :soon ]

  def home
    @products = Product.all
  end
  def soon
  end
end

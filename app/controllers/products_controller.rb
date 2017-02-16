class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :show, :index]

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.where("ancestry is null").arrange
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_product
    params.require(:product).permit(
        :name, :sku, :state,
        :supplier_id, :brand_id, :purchasing_price,
        :coefficient, :discount_rate,
        :price, :weight, :stock,
        :description, :brand_id,
        :supplier_id, photos: [] )
  end
end


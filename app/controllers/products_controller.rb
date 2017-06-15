class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @products = Product.all.where(active: true)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    @categories = Category.where("ancestry is null").arrange
    @category = Category.find(@product.category_id)
  end

  def new
    @product = Product.new
    @suppliers = Supplier.all
    @brands = Brand.all
    @list_categories = Category.find(
                          Category.all
                                  .map{|cat| !cat.has_children? ? cat.id : 0}
                                  .reject{|e| e == 0}
                                  )
    # list_categoriesA = list_categories.reject{|e| e == 0}
    # @list_categories = Category.find(list_categories)
    #TODO
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
        :description, :home, :category_id, photos: [] )
  end
end


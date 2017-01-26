class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @categories = Category.where("ancestry is null").arrange

    category_id = params[:id].split('/').last.to_i
    @category = Category.find(category_id)

    if Category.find(category_id).child_ids.size == 0
      @products = @category.products
    end
  end
end


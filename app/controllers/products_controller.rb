class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
    # render 'index'
  end
end

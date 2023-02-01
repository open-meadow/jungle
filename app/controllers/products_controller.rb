class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @sales = Sale.active.take
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where("product_id =?", @product.id)
    @review = Review.new
  end

end

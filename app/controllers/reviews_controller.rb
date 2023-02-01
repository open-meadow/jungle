class ReviewsController < ApplicationController

  def create    
    req_params = review_params
    req_params[:user_id] = session[:user_id]
    @review = Review.new(req_params)
    # puts "This is review: ", @review.all

    if @review.save
      redirect_to "/products/#{req_params[:product_id]}"
    else
      redirect_to "/products/#{req_params[:product_id]}"
    end
    
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{@review[:product_id]}"
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating
    )
  end
end

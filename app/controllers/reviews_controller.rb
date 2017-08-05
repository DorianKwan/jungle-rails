class ReviewsController < ApplicationController

  def create 
    @product     = Product.find params[:product_id]
    @review      = @product.reviews.create review_params
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      redirect_to product_path(@product), flash: { error: 'Review failed to create' }
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

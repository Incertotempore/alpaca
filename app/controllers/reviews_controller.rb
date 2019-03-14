class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.item = Item.find(params[:item_id])
    @review.save!

    redirect_to item_path(@review.item)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

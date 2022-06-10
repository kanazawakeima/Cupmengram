class ReviewsController < ApplicationController
  def index
    @food = Food.find(params[:food_id])
    @reviews = @food.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to food_reviews_path(@review.food)
    else
      @food = Food.find(params[:food_id])
      render template: "foods/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:food_id, :score, :content)
  end
end

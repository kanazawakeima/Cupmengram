class ReviewsController < ApplicationController
  def index
    @food = Food.find(params[:food_id])
    @reviews = @food.reviews
  end

  def create
    @food = Food.find(params[:food_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      @food.update(scores: review_avg_score)
      redirect_to food_reviews_path(@review.food), notice: "投稿しました。"
    else
      @food = Food.find(params[:food_id])
      render template: "foods/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:food_id, :score, :content)
  end

  def review_avg_score
    unless @food.reviews.empty?
      @food.reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  def review_score_percentage
    unless @food.reviews.empty?
      @food.reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end

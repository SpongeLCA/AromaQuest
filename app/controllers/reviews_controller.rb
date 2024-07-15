class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = current_user.Review.build(review_params)
    if @review.save
      redirect_to perfume_path(@review.perfume), notice: 'avis ajoute avec succes'
    else
      redirect_to perfume_path(@review.perfume), alert: 'impossible de mettre un avis'
    end
  end

  private

  def review_params
    params.require(:review).permit(:perfume_id, :comment, :rating)
  end
end

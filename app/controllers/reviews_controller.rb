class ReviewsController <  ApplicationController
  before_action :set_review, only: [:destroy]

  # POST /reviews
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail.reviews.create!(review_params)

    set_rating(@cocktail)

    redirect_to cocktail_path(params[:cocktail_id])
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy

    @cocktail = Cocktail.find(params[:cocktail_id])
    set_rating(@cocktail)

    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def set_rating(cocktail)
    if cocktail.reviews
      a = cocktail.reviews.map{|a| a[:rating].to_i};
      rating = a.any? ? (a.reduce(:+).to_f / a.size).round : 0
      cocktail.rating = rating
    else
      cocktail.rating = 0
    end
    cocktail.save!
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

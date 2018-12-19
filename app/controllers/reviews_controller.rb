class ReviewsController < ApplicationController
   def new
     @review = Review.new
   end
   
   def create
       @review = current_user.reviews.build(review_params)
     if @review.save
       redirect_to user_review_path(current_user, @review)
     else
       render :new
     end
   end 
   
   def show
     @review = Review.find(params[:id])
   end
   
   def index
    if params[:concert_id]
			@reviews = Concert.find(params[:concert_id]).reviews
			respond_to do |format|
				format.html {render :index}
				format.json {render json: @reviews}
			end
		
    else
			@reviews = Review.all
			respond_to do |format|
				format.html {render :index}
				format.json {render json: @reviews}
			end
    end
   end
	 
  private
    def review_params
      params.require(:review).permit(:concert_id, :comment ,:rating,
      concert_attributes: [:name, :artist, :venue])
    end 
    
end

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
    else
      @reviews = Review.all
    end
   end
   
   
  private
    def review_params
      params.require(:review).permit(:concert_id, :comment ,:rating)
    end 
    
end

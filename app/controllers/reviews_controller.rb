class ReviewsController < ApplicationController
   def new
     @review = Review.new
   end
   
   def create 
       @review = current_user.reviews.build(review_params)
       
     if @review.save
       redirect_to review_path(@review)
     else
       render :new
     end
   end 
   
   def show
     @review = Review.find(params[:id])
   end
   
   
   
  private
    def review_params
      params.require(:review).permit(:concert_id, :comment ,:rank)
    end 
    
end

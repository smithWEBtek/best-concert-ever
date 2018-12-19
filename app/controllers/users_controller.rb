class UsersController < ApplicationController
    def show 
      @user = User.find(params[:id])			
			respond_to do |format|
				format.html {render :show}
				format.json {render json: @user}
			end
    end
    
    def index
      @users = User.all 
      @reviews = Review.all
    end 
end

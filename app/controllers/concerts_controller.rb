class ConcertsController < ApplicationController
   
   def index
     @concerts = Concerts.all
   end
   
   def new
    @concert = Concert.new
   end

   def create
     @concert = Concert.new(concert_params)

     if @concert.save
       redirect_to concert_path(@concert)
     else
       render :new
     end
   end

    def show
     @concert = Concert.find(params[:id])
    end

  private
    def concert_params
      params.require(:concert).permit(:name, :artist, :venue)
    end
   
end

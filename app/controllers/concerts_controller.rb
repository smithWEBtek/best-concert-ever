class ConcertsController < ApplicationController

   def index
     @concerts = Concert.all
   end

   def new
    binding.pry
    @concert = Concert.new
    #conditional for if there are errors
    #store errors in instance variables so that we will have access to them in the new view
      if flash[:errors]
        @errors = "name cannot be blank"
      end

   end

   def create
     @concert = Concert.new(concert_params)

     if @concert.save
       redirect_to concert_path(@concert)
     else
       # let the user know about errors and redirect to new view
       #flash[:notice] = "hello"
       flash[:errors]= @concert.errors.messages
       redirect_to action: "new"
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

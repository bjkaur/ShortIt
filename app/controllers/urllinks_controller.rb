class UrllinksController < ApplicationController
    # is looking for instant variables that have been set
    # Using create method as a JS Endpoint 
    # by rendering JS template back to the server
    def create
        shortit = Shortit.new(urllink_params[:original_url])
        @urllink = shortit.generate_short_link

        respond_to do |format|
          format.html 
          format.js #{ render :create }
        end


    end 

    def error
    end
    
    private
    def urllink_params
        params.require(:urllink).permit(:original_url)
    end
end

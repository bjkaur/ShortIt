class UrllinksController < ApplicationController
    # is looking for instant variables that have been set
    # Using create method as a JS Endpoint 
    # by rendering JS template back to the server
    def create
        shortit = Shortit.new(urllink_params[:original_url])
        @shortit = shortit.generate_short_link
    end 

    private
    def urllink_params
        params.require(:urllink).permit(:original_url)
    end
end
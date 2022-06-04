class HomeController < ApplicationController
  def index
    # initialise a new instance variable
    @urllink = Urllink.new()
  end
end

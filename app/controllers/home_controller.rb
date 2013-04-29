class HomeController < ApplicationController
  require 'addressable/uri'

  # GET /maps
  # GET /maps.json
  def index
    # @user_loc = [37.853134, -122.267646]
    if params[:distance]
      @distance = params[:distance]
    else
      @distance = 10
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

end
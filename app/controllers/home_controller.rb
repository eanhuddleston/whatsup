class HomeController < ApplicationController
  require 'addressable/uri'

  # GET /maps
  # GET /maps.json
  def index
    unless user_signed_in?
      redirect_to new_user_session_url and return
    end

    if params[:distance]
      @distance = params[:distance]
    else
      @distance = 3
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

end
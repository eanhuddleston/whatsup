class HomeController < ApplicationController
  require 'addressable/uri'

  # GET /maps
  # GET /maps.json
  def index
    unless user_signed_in?
      redirect_to new_user_session_url and return
    end

    @user = current_user
    @user_loc = [@user.latitude, @user.longitude]

    if params[:distance]
      @distance = params[:distance]
    else
      @distance = 3
    end

    @events = Event.near(@user_loc, @distance)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @events }
    end
  end

end
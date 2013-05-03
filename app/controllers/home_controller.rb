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
    puts "**************************"
    puts @user_loc

    if params[:distance] && params[:distance] != ""
      @distance = params[:distance]
    elsif params[:prev_distance]
      @distance = params[:prev_distance]
    else
      @distance = 4
    end

    if params[:search_days] && params[:search_days] != ""
      @search_days = params[:search_days].to_i
    else
      @search_days = 7
    end

    if params[:categories]
      @selected_categories = params[:categories].map {|id| Category.find(id)}
    else
      @selected_categories = Category.all
    end

    @events_within_range = Event.near(@user_loc, @distance)
    @trimmed_events = []

    @events_within_range.each do |event|
      if @selected_categories.include?(event.categories[0])
        if ( (event.datetime > DateTime.now) && 
            (event.datetime < DateTime.now + @search_days.days) )
          @trimmed_events << event
        end
      end
    end

    @avail_categories = []
    @events_within_range.each do |event|
      event.categories.each do |category|
        @avail_categories << category unless @avail_categories.include?(category)
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @events,
          :include => [:categories => {:only => :name}] }
    end
  end

end
class HomeController < ApplicationController
  require 'addressable/uri'

  before_filter :authenticate_user!

  # GET /maps
  # GET /maps.json
  def index
    @user = current_user

    @distance, @search_days, @selected_categories = parse(params)

    @events_within_range = Event.near(@user.loc, @distance)
    @relevant_events = Event.trim(@events_within_range, @search_days, @selected_categories)

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
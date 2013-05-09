class ApplicationController < ActionController::Base
  protect_from_forgery

  def parse(params)
    if params[:distance] && params[:distance] != ""
      distance = params[:distance]
    elsif params[:prev_distance]
      distance = params[:prev_distance]
    else
      distance = 4
    end

    if params[:search_days] && params[:search_days] != ""
      search_days = params[:search_days].to_i
    else
      search_days = 7
    end

    if params[:categories]
      selected_categories = params[:categories].map {|id| Category.find(id)}
    else
      selected_categories = Category.all
    end

    [distance, search_days, selected_categories]
  end
end

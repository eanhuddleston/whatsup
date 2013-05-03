class ReservationsController < ApplicationController
  def create

    @reservation = Reservation.new(params[:reservation])

    if current_user.nil?
      flash[:alert] = "You need to be logged in to be counted"
      redirect_to event_url(@reservation.event_id)
      return
    else
      @reservation.user_id = current_user.id
    end

    if @reservation.save
      redirect_to event_url(@reservation.event_id)
    else
      flash[:alert] = "You can only be counted once"
      redirect_to event_url(@reservation.event_id)
    end
  end
end

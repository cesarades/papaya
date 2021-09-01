class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    @booking.pending = true
    redirect_to event_path(@event) if @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @event = Event.find(params[:event_id])
    @booking.delete
    redirect_to event_path(@event), alert: "You've unregistered for this event"
  end
end

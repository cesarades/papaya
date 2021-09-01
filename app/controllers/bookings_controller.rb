class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    redirect_to event_path(@event), notice: "You've registered for this event!" if @booking.save
  end

  def destroy
    @booking.destroy
    redirect_to :back
  end
end

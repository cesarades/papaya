class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @events = Event.where('start_time > ?', DateTime.now)
    if params[:query].present? && params[:query].reject(&:empty?).present?
      @events = Event.search(params[:query])
    else
      @events = Event.all
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.where(user: current_user, event: @event)
    @booking = @booking.empty? ? Booking.new : @booking[0]
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      # render 'pages/profile'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      # render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:capacity, :name, :description, :category,
                                  :recurrence_times, :recurrence_frequency,
                                  :address, :latitude, :longitude, :start_time, :end_time, :photo)
  end
end

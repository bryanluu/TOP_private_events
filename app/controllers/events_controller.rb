class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @event = current_user.events.build
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all.includes(:attendees)
  end

  def register
    @event = Event.find(params[:id])
    already_present = @event.attendees.include?(current_user)
    if already_present
      current_user.attended_events.delete(@event.id)
    else
      @event.attendees << current_user
    end

    puts "Register #{current_user.name}: #{already_present}"
    render :show
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :desc)
  end
end

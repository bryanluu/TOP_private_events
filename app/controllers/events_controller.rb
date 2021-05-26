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
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :desc)
  end
end

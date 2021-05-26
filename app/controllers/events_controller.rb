class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:create]

  def new
    @user = current_user
    @event = current_user.events.build
  end

  def create
    @event = @user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
  end

  private

  def authorize_user
    @user = User.find(params[:user_id])
    unless current_user == @user
      flash[:alert] = "You must be logged in to access this user"
      redirect_to current_user
    end
    # flash[:notice] = "Current user: #{current_user.email}, id: #{current_user.id}"
  end

  def event_params
    params.require(:event).permit(:title, :location, :date, :desc)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def show
    @user = current_user
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit([:name, :email])
  end

  def authorize_user
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:alert] = "You must be logged in to access this user"
      redirect_to current_user
    end
    # flash[:notice] = "Current user: #{current_user.email}, id: #{current_user.id}"
  end
end

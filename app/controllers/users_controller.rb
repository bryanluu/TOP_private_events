class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit([:name, :email])
  end

  def authorize_user
    unless current_user.id.to_s == params[:id]
      flash[:alert] = "You must be logged in to access this user"
      redirect_to current_user
    end
    # flash[:notice] = "Current user: #{current_user.email}, id: #{current_user.id}"
  end
end

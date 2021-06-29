class UsersController < ApplicationController
  before_action :same_profile, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def same_profile
    unless current_user.id.to_s == params[:id]
      flash[:alert] = "You dont have access to this page"
      redirect_to root_path
    end
  end
end

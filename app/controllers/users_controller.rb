class UsersController < ApplicationController
  before_action :same_profile, only: [:show]

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @past_events = current_user.attended_events.previous_events
    @upcoming_events = current_user.attended_events.upcoming_events
  end

  private

  def same_profile
    return if current_user && current_user.id.to_s == params[:id]

    flash[:alert] = 'You dont have access to this page'
    redirect_to root_path
  end
end

class EventAttendancesController < ApplicationController
  def create
    event = Event.find(params[:event])
    confirmation = event.event_attendances.build(attendee_id: current_user.id)
    if confirmation.save
      redirect_to event
    else
      render root_path
    end
  end

  def destroy
    event = Event.find(params[:event])
    user = User.find(params[:user])
    user.attended_events.destroy(event)
    redirect_to user
  end
end

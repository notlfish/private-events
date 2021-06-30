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
end

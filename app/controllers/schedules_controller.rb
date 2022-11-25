class SchedulesController < ApplicationController
  include ActionView::RecordIdentifier # adds `dom_id`

  def index
    @rides = policy_scope(Ride)
    @rides = Ride.where(user_id: current_user.id)

  end

  def update

    @match = Match.find(params[:id])
    @match.finished = true
    authorize @match
    if @match.save

      redirect_to schedules_path( anchor: dom_id(@match) )
      flash[:notice] = "Carona confirmada!"
    end
  end
end

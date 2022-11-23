class MatchesController < ApplicationController
  before_action :set_ride, only: %i[new create]

  def new
    if @ride.user.id == current_user.id
      redirect_to ride_path(@ride)
    else
      @matche = Matche.find_by(ride_id: @ride) || Matche.new
      authorize @matche
    end
  end

  private

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end

end

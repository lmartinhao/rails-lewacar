class RidesController < ApplicationController
  before_action :set_ride, only: %i[show]

  def index
    @rides = Ride.all
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ride
    @ride = Ride.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ride_params
    params.require(:ride).permit(:user, :route, :date, :price, :pickup_address, :time, :passengers)
  end
end

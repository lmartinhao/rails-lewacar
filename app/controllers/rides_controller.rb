class RidesController < ApplicationController
  before_action :set_ride, only: %i[show edit update]
  before_action :verify_policy_scope, only: :index
  skip_before_action :authenticate_user!, only: :index

  def index
    @rides = policy_scope(Ride)
  end

  def show
    authorize @ride
    @markers = [{lat: @ride.latitude, lng: @ride.longitude}]
  end

  def new
    @ride = Ride.new
    authorize @ride
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    authorize @ride
    if @ride.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @ride
  end

  def update
    authorize @ride
    if @ride.update(ride_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ride
    @ride.destroy
    redirect_to rides_url, notice: "Ride was successfully destroyed."
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

  def verify_policy_scope
    true
  end
end

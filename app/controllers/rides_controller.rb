class RidesController < ApplicationController
  def index
    @rides = policy_scope(Ride)
  end

  def show
    authorize @ride
  end

  def new
    @ride = Ride.new
    authorize @ride
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    authorize @ride
  end

  def edit
    authorize @ride
  end

  def update
    authorize @ride
  end

  def destroy
    authorize @ride
  end
end

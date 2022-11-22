class RidesController < ApplicationController
  before_action :set_ride, only: [:edit, :update]

  def index
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    puts(current_user.email)
    @ride.user = current_user
    if @ride.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ride.update(ride_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:route, :date, :price, :pickup_address, :time, :passengers)
  end

end

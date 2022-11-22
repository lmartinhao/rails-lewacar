class RidesController < ApplicationController
  def index
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(rides_params)
    puts(current_user.email)
    @ride.user = current_user
    if @ride.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rides_params
    params.require(:ride).permit(:route, :date, :price, :pickup_address, :time, :passengers)
  end

end

class MatchesController < ApplicationController
  before_action :set_ride, only: %i[new create]
  after_action :can_matche?, only: :new

  def new
    if @ride.user.id == current_user.id
      redirect_to ride_path(@ride)
    else
      @matches = Matche.where(ride_id: @ride) || Matche.new
      @matche = Matche.new
      @can_matche = can_matche?
      authorize @matche
    end
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @matche = Matche.new
    @matche.ride = @ride
    @matche.user = current_user
    authorize @matche
    if @matche.save
      redirect_to ride_path(@ride)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end

  def can_matche?
    @matches.each do |m|
      return false if m.user.id == current_user.id
    end
  end
end

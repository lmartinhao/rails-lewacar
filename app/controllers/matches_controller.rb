require 'qrcode_pix_ruby'

class MatchesController < ApplicationController
  before_action :set_ride, only: %i[new create]
  #after_action :qrcode_pix, only: %i[new]
  #after_action :can_matche?, only: :new

  def new
    if @ride.user.id == current_user.id
      redirect_to ride_path(@ride)
    else
      @matches = Matche.where(ride_id: @ride) || Matche.new
      @matche = Matche.new
      @can_matche = can_matche?
      qrcode_pix
      authorize @matche
    end
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @matche = Matche.new(matche_params)
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

  def matche_params
    params.require(:matche).permit(:transaction_pix)
  end

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end

  def can_matche?
    @matches.each do |m|
      return false if m.user.id == current_user.id
    end
  end

  def qrcode_pix
    @pix = QrcodePixRuby::Payload.new(
      pix_key:        @ride.user.email,
      merchant_name:  @ride.user.first_name,
      merchant_city:  'Brasil',
      country_code:   'BR',
      currency:       '986',
      amount:         @ride.price,
      repeatable:     false
    )
  end

end

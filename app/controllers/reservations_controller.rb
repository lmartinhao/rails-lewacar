class ReservationsController < ApplicationController
  before_action :verify_policy_scope, only: :index
  def index
    @matches = policy_scope(Match)

    @matches = current_user.matches
  end

  private

  def verify_policy_scope
    true
  end
end

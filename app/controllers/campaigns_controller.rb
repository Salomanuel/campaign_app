class CampaignsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]

  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  def destroy
  end

  def create
  end
end

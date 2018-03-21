class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  def destroy
  end

  def create
  end
end

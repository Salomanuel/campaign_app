class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end
end

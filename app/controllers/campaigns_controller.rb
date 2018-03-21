class CampaignsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user, only: [:destroy, :create]
  # add filters to campaign creation for expert users 

  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  def destroy
    @campaign.destroy
    flash[:success] = "Campaign deleted"
    redirect_to current_user
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)
    if @campaign.save
      flash[:success] = "Campaign created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :purpose)
    end

    def correct_user
      @campaign = current_user.campaigns.first
      redirect_to current_user if @campaign.nil?
    end
end

class CampaignsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  # add filters to campaign creation for expert users 

  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  def destroy
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)
    if @campaign.save
      flash[:success] = "Campaign created!"
      redirect_to campaigns_path
    else
      render 'static_pages/home'
    end

    private
      def campaign_params
        params.require(:campaign).permit(:title, :purpose)
      end
  end
end

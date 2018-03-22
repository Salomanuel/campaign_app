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
    @discussions = Discussion.all.map{ |a| [a.title, a.id] }
    if @campaign.save
      flash[:success] = "Campaign created!"
      redirect_to current_user
    else
      flash[:danger] = "we may have a problem"
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @comments = @campaign.comments
    @comment = Comment.new
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :purpose, :discussion_id, :tag_list, :estimated_duration)
    end

    def correct_user
      @campaign = current_user.campaigns.first
      # redirect_to current_user if @campaign.nil?
    end
end

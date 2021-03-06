class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # # lists the users campaigns (that should be just one actually)
    # # for new campaign
    @campaign = current_user.build_campaign if @user.campaign.nil?
    @discussions = Discussion.all.map{ |a| [a.title, a.id] }
    @durations = [["within one week", true],["within one month", false],["within three months", nil]]
    @discussion = current_user.build_discussion if current_user.discussion.nil?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.status = false
    if @user.save
      log_in @user
      flash[:success] = "Welcome in!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(expert_params)
      redirect_to users_path
    else
      render 'index'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def expert_params
      params.require(:user).permit(:expert)
    end

    # before filters
    def logged_in_user
      unless logged_in? # from sessions_helper
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
end

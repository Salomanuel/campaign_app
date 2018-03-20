class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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

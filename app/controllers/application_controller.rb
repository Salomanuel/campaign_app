class ApplicationController < ActionController::Base
  # for CSRF protection
  protect_from_forgery with: :exception

  include SessionsHelper

  private

    # confirms a logged-in user
    def logged_in_user
      unless logged_in?
        # store_location # could implement that
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
end

class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_court
  layout "admin"

  private
    def authenticate_admin!
      redirect_to new_user_session_path unless current_user && ( current_user.admin? || current_user.court_user?)
    end

    def set_court
      if current_user.court_user?
        @court = current_user.court
      end
    end
end

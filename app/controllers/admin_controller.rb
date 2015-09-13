class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  private
    def authenticate_admin!
      redirect_to new_user_session_path unless current_user && ( current_user.admin? || current_user.court_user?)
    end
end

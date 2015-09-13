class Admin::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  layout "admin"

  def new
    self.resource = resource_class.new
    render :new
  end


  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:accept_invitation).concat [:court_id]
      devise_parameter_sanitizer.for(:invite).concat [:court_id]
    end
end

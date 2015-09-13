class ApiController < ApplicationController
  before_action :authorize_request!
  layout "admin"

  def index
  end

  private
    def authorize_request!
      # authorized for now
    end
end

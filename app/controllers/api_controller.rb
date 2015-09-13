class ApiController < ApplicationController
  before_action :authorize_request!, except: [:docs, :regenerate_token]
  layout "admin"

  def docs
  end

  def regenerate_token
    current_user.regenerate_token
    redirect_to api_index_path
  end

  private
    def authorize_request!
      token = request.headers['Authorization']
      unless token && User.where(token: token).any?
        render status: 403, json: {"error" => "Invalid API Token."}
      end
    end
end

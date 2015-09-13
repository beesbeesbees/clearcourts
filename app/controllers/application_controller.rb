class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_action_to_s(controller, action, params)
    controller.class_eval do
      def params=(params)
        @params= params
      end
      def params
        @params
      end
    end
    instance= controller.new
    instance.request= @_request
    instance.response= @_response
    instance.params= params
    instance.process_action(action)
    instance.send(action)
    instance.response.body
  end

private

  def after_invite_path_for(resource)
    new_user_invitation_path
  end
end

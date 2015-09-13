module ApplicationHelper

  def render_action(controller, action, params)
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

  def court_text(court)
    if court
      court.court_address
    else
      'No Court Associated'.freeze
    end
  end
end

class Api::CitationsController < ApiController
  def index
    @citations = Citation.all
    render json: @citations
  end
end

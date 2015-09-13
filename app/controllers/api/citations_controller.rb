class Api::CitationsController < ApiController
  def index
    @citations = Citation.all

    render json: @citations
  end

  def show
    @citation = Citation.find(params[:id])

    render json: @citation
  end
end

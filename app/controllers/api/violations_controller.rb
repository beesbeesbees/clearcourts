class Api::ViolationsController < ApiController

  def index
    @violations = Violation.all

    render json: @violations
  end

  def show
    @violation = Violation.find(params[:id])

    render json: @violation
  end
end

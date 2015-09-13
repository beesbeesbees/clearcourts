class CourtsController < ApplicationController
  before_action :set_court, only: [:show]

  def index
    @courts = Court.all
  end

  def show
  end


  private
    def set_court
      @court = Court.find(params[:id])
    end

end

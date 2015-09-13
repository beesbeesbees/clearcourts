class CitationsController < ApplicationController
  before_action :set_citation, only: [:show]

  def index
    @citations = Citation.all
  end

  def show
  end


  private
    def set_citation
      @citation = Citation.find(params[:id])
    end

end

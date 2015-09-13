class Admin::CitationsController < ApplicationController
  before_action :set_citation, except: [:index, :csv, :import]
  layout "admin"

  def index
    set_citations
  end

  def edit
  end

  def update
    if @citation.update citation_params
      redirect_to edit_admin_citation_path(@citation), notice: "Updated Successfully! :)"
    else
      redirect_to edit_admin_citation_path(@citation), notice: "There were errors updating"
    end
  end

  def csv
  end

  def import
    begin
    if params[:commit] == "Import Citations"
      count = Citation.import(params[:file])
    else
      count = Violation.import(params[:file])
    end
    rescue
      redirect_to csv_admin_citations_path, notice: "Please upload a csv formatted properly"
    end

    redirect_to csv_admin_citations_path, notice: "Successfully imported #{count} files!"
  end

  private
    def set_citations
      if current_user.court_user?
        @citations = current_user.court.citations.includes(:violations)
      else
        @citations = Citation.all.includes(:violations)
      end
    end

    def set_citation
      @citation = Citation.find(params[:id])

      if current_user.court_user?
        redirect_to :back, notice: "Unauthorized Access" unless current_user.court.citations.include?(@citation)
      end
    end

    def citation_params
      params.require(:citation).permit(
        :citation_number, :citation_date, :first_name, :last_name, :drivers_license_number, :date_of_birth,
        :defendant_address, :defendant_city, :defendant_state, violations_attributes:
        [:violation_number, :violation_description, :warrant_status, :status, :status_date, :fine_amount, :court_cost, :id, :warrant_number]
      )
    end
end

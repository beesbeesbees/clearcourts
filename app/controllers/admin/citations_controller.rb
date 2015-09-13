class Admin::CitationsController < ApplicationController
  layout "admin"

  def index
    set_citations
  end

  private
    def set_citations
      if current_user.court_user?
        @citations = current_user.court.citations.includes(:violations)
      else
        @citations = Citations.all.includes(:violations)
      end
    end
end

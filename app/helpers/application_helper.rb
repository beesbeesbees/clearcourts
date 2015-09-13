module ApplicationHelper

  def court_text(court)
    if court
      court.court_address
    else
      "No Court Associated"
    end
  end
end

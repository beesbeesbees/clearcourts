# == Schema Information
#
# Table name: sessions
#
#  id             :integer          not null, primary key
#  phone_number   :string(255)
#  email          :string(255)
#  contact_method :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  state          :string(255)
#

class Session < ActiveRecord::Base
  SMS_SESSION_TIMEOUT_SECONDS= 20
  has_many :reminders

  create_with state: :begun

  def web?
    phone_number.!
  end
  def web!
    update!(phone_number: nil)
  end

  state_machine :state, initial: :begun do
  event :started_process do
    transition :begun => :said_hi
    #ask for first name
  end

  event :added_first_name do
    transition :said_hi => :got_first_name
    #ask if they want to search by name or citation number. they will enter the number or their name
  end

  event :added_citation_number do
    transition :got_first_name => :got_citation_number
    #query the db, display results
  end

  event :added_last_name do
    transition :got_first_name => :got_last_name
    #ask for year of birth
  end

  event :added_birth_year do
    transition :got_last_name => :got_birth_year
    #ask for month of birth
  end

  event :added_birth_month do
    transition :got_birth_year => :got_birth_month
    #ask for day of birth
  end

  event :added_birth_day do
    transition :got_birth_month => :got_birth_day
    #query the db, display results
  end

  event :saw_results do
    transition [:got_birth_day, :got_citation_number] => :citation_results
    #ask user to choose one or none
  end

  event :get_choice do
    transition :citation_results => :chose_one_citation
    #set up reminders. user can choose court info, payment options, other options, view other citations
  end

  event :single_citation do
    transition :chose_one_citation => :court_info
    #
  end

  event :none_of_the_above do
    transition :citation_results => :help_line
    # display main phone numbers to call for help
  end

  end

end

#single_citation_chosen (create reminder here)
#payment
#court_info
#resolved
#finished

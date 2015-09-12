class Session < ActiveRecord::Base
  has_many :reminders

  state_machine :state, initial: :begun do
 	event :started_process do
		transition :begun => :got_first_name
		#ask for first name
	end

	event :added_first_name do
		transition :got_first_name => :got_search_criteria
		#ask if they want to search by name or citation number. they will enter the number or their name
	end

	event :added_citation_number do
		transition :got_search_criteria => :got_citation_number
		#query the db
	end

	event :added_last_name do
		transition :got_search_criteria => :got_last_name
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
		#query the db
	end

	event :query_db do
		transition :got_birth_day, :got_citation_number => :showed_citation_results
		#query the db
	end	

  end

end

#all_citations
#single_citation_chosen (create reminder here)
#payment
#court_info
#resolved
#finished
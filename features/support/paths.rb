module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
	def path_to(page_name)
		case page_name
	
		when /the homepage/
		  '/'
		when /the project page for "([^\"]*)"/
			project_path(project($1))
		when /the "([^\"]*)" ticket in the "([^\"]*)" project/
			project_ticket_path(project($2), Ticket.find_by_title($1))
		when /the search page/
		  '/search'
		when /the extensions page/
		  '/extensions'
		when /the authors page/
		  '/authors'
		when /the login page/
		  '/login'
		when /the extension listing/
		  '/extensions'
		when /the new extension page/
		  '/extensions/new'
		when /the all extensions page/
		  '/extensions/all'
		else
		  raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
			"Now, go and add a mapping in #{__FILE__}"
		end
  	end
  
  	def project(name)
		Project.find_by_name!(name)
	end

end

World(NavigationHelpers)

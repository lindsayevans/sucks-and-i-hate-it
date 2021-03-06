# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

    before_filter :login_from_cookie

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '929b79453bc0d77c5532cd118ea8f935'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password


    def view_thing thing
	@thing = thing
	render :template => 'things/view'
	#render :text => '<pre>'+YAML::dump(@thing)
    end

    def new_thing attributes
	@thing = Thing.new attributes
	render :template => 'things/new'
	#render :text => '<pre>'+YAML::dump(@thing)
    end

    def login_from_cookie
	@current_user = Person.find :first
    end

end

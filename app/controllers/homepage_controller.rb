class HomepageController < ApplicationController

    def index

	host_parts = request.host.split('.')
	return view_homepage if host_parts.length == 2
	
	@thing_url = request.host.split('.').first
	@thing = Thing.find_by_url @thing_url

	if !@thing.nil?
	    params[:name] = @thing.name
	    return view_thing @thing
	else
	    @thing_name = @thing_url.titleize
	    return new_thing({:url => @thing_url, :name => @thing_name, :type => Thing.type_from_domain(request.domain)})
	end
    end

    private

    def view_homepage
	#render :text => '<h1>Welcome to Sucks and I hate it!</h1>'
    end

end

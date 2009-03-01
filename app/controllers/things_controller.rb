class ThingsController < ApplicationController

    def view
	@thing = Thing.find_by_url params[:url].downcase
	return view_thing @thing
    end

end

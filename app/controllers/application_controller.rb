# Create a global app controller which inherits from sinatra::base so 
# we can stuff helper methods and/or common configs etc for other controllers
# throughout the app

class ApplicationController < Sinatra::Base
	get '/' do 
		'Hello LR'
	end
end
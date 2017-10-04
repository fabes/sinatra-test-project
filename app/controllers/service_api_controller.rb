class ServiceApiController < ApplicationController 
	get '/' do 
		'<a href="/api/v1/resources/fetch-data"> Fetch Records </a>'
	end

	get '/resources/fetch-data' do 
		@documents = Document.all(:order => [ :id.desc ], :limit => 1)
		@documents.to_json
	end
end
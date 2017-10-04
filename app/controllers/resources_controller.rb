require 'httparty'

class ResourcesController < ApplicationController
	enable :sessions

	get '/' do 
		'<a href="/resources/fetch">Fetch Data</a>'
	end

	get '/fetch' do 
		response = HTTParty.get 'http://node01.public.learningregistry.net/slice?from=2011-06-10'
		data = response.parsed_response.to_json
		results = JSON.parse(data)

		# Get first set of records
		results['documents'].map{ |r| Sinatra::FetchedData.store(r)}

		# Store resumption_token in a session
		session[:resumption_token] = results['resumption_token']

		# Loop to get more records using resumption_token
		29.times do 
			response = HTTParty.get "http://node01.public.learningregistry.net/slice?from=2011-06-10&resumption_token=#{session[:resumption_token]}"
			data = response.parsed_response.to_json
			results = JSON.parse(data)
	
			results['documents'].map{ |r| Sinatra::FetchedData.store(r)}

			#	Update session variable
			session[:resumption_token] = results['resumption_token']
		end
	end
end
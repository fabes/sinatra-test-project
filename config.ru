require 'sinatra'
require 'sinatra/base'
require 'rubygems'
require 'data_mapper'

# Configure database
configure :development do
	DataMapper.setup(:default, 'postgres://dbtech:password@localhost/fabion_s_lr_test_development')
end

# Automatically require files in the models/views/controllers 
# directories to follow a minimal MVC pattern
Dir.glob('./app/{models,views,controllers,helpers}/*.rb').each { |file| require file }

#	Mapping routes to controllers
map('/') { run ApplicationController }
map('/resources') { run ResourcesController }
map('/api/v1') { run ServiceApiController }
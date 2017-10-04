configure :development do
  set :database, {
		adapter: 'postgresql',  
		encoding: 'unicode', 
		database: 'lr_dev', 
		pool: 2, 
		username: 'dbtech'
	}
end
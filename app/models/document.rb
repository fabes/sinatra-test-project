class Document 
	include DataMapper::Resource
	property 	:id, Serial
	property 	:doc_id, String
	property 	:doc_type, String
	property 	:resource_data, Text
	property	:resource_locator, String
	property 	:create_timestamp, DateTime
	property 	:update_timestamp, DateTime
	property 	:active, Boolean
	property 	:publishing_node, String
	property 	:owner, String
	property 	:submitter, String
	property 	:submitter_type, String
	property 	:curator, String
	property	:doc_version, String
end

# DataMapper sanitization and initializing relationships
DataMapper.finalize

# Migrate the document obect
Document.auto_upgrade!
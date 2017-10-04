require 'sinatra/base'

module Sinatra
  module FetchedData
    def self.store(data)
      resource_desc = data['resource_data_description']
      data_identity = data['resource_data_description']['identity']

      if data_identity.is_a? Array 
        resource_desc_identity = data_identity[0]
      else 
        resource_desc_identity = data_identity
      end

      Document.create(
        doc_id: data['doc_ID'], 
        doc_type: resource_desc['doc_type'],
        resource_data: resource_desc['resource_data'],
        resource_locator: resource_desc['resource_locator'],
        create_timestamp: resource_desc['create_timestamp'],
        update_timestamp: resource_desc['update_timestamp'],
        active: resource_desc['active'],
        publishing_node: resource_desc['publishing_node'],
        owner: resource_desc_identity['owner'],
        submitter: resource_desc_identity['submitter'],
        submitter_type: resource_desc_identity['submitter_type'],
        curator: resource_desc_identity['curator'],
        doc_version: resource_desc['doc_version']
        )
    end
  end

  helpers FetchedData
end
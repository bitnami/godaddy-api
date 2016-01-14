module GodaddyApi
  class SpecResource < ResourceKit::Resource
    include ResourceHelper

    resources do
      # TODO: is there any way to do this using inheritance / modules ?
      default_handler(*Errors::Generic::standard_error_codes) { |r| Errors::Generic::standard_error_handle r }

      action :list, 'GET /v1/cloud/specs' do
        query_keys :limit, :offset
        handler(200) { |response| SpecMapping.extract_collection(response.body, :read) }
      end

      action :find, 'GET /v1/cloud/specs/:id' do
        handler(200) { |response| SpecMapping.extract_single(response.body, :read) }
      end
    end
  end
end

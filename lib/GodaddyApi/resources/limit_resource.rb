module GodaddyApi
  class LimitResource < ResourceKit::Resource
    resources do
      # TODO: is there any way to do this using inheritance / modules ?
      default_handler(*Errors::Generic::standard_error_codes) { |r| Errors::Generic::standard_error_handle r }

      action :all, 'GET /v1/cloud/limits' do
        handler(200) { |response| LimitMapping.extract_single(response.body, :read) }
      end

      action :list, 'GET /v1/cloud/limits' do
        handler(200) { |response| LimitMapping.extract_single(response.body, :read) }
      end
    end
  end
end

module GodaddyApi
  class ServerResource < ResourceKit::Resource
    include ResourceHelper

    resources do
      # TODO: is there any way to do this using inheritance / modules ?
      default_handler(*Errors::Generic::standard_error_codes) { |r| Errors::Generic::standard_error_handle r }

      action :list, 'GET /v1/cloud/servers' do
        query_keys :limit, :offset
        handler(200) { |response| ServerMapping.extract_collection(response.body, :read) }
      end

      action :find, 'GET /v1/cloud/servers/:id' do
        handler(200) { |response| ServerMapping.extract_single(response.body, :read) }
      end

      action :create, 'POST /v1/cloud/servers' do
        body { |object| ServerMapping.representation_for(:create, object) }
        handler(201, 202) { |response| ServerMapping.extract_single(response.body, :read) }
      end

      action :actions, 'GET /v1/cloud/servers/:id/actions' do
        handler(200) { |response| ActionMapping.extract_collection(response.body, :read) }
      end

      action :destroy, 'POST /v1/cloud/servers/:id/destroy' do
        handler(202) { |_| true }
      end

      action :start, 'POST /v1/cloud/servers/:id/start' do
        handler(202) { |_| true }
      end

      action :stop, 'POST /v1/cloud/servers/:id/stop' do
        handler(202) { |_| true }
      end
    end
  end
end

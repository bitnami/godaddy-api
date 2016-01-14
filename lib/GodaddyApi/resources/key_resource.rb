module GodaddyApi
  class KeyResource < ResourceKit::Resource
    include ResourceHelper

    resources do
      # TODO: is there any way to do this using inheritance / modules ?
      default_handler(*Errors::Generic::standard_error_codes) { |r| Errors::Generic::standard_error_handle r }

      action :list, 'GET /v1/cloud/sshKeys' do
        query_keys :limit, :offset
        handler(200) { |response| KeyMapping.extract_collection(response.body, :read) }
      end

      action :find, 'GET /v1/cloud/sshKeys/:id' do
        handler(200) { |response| KeyMapping.extract_single(response.body, :read) }
      end

      action :create, 'POST /v1/cloud/sshKeys' do
        body { |object| KeyMapping.representation_for(:create, object) }
        handler(201, 202) { |response| KeyMapping.extract_single(response.body, :read) }
        # Error handling
        # handler(422) { |response| ErrorMapping.fail_with(FailedCreate, response.body) }
      end

      action :destroy, 'DELETE /v1/cloud/sshKeys/:id' do
        handler(204) { |response| true }
      end
    end
  end
end

module GodaddyApi
  class ImageResource < ResourceKit::Resource
    include ResourceHelper

    resources do
      # TODO: is there any way to do this using inheritance / modules ?
      default_handler(*Errors::Generic::standard_error_codes) { |r| Errors::Generic::standard_error_handle r }

      action :list, 'GET /v1/cloud/images' do
        query_keys :limit, :offset
        handler(200) { |response| GodaddyApi::ImageMapping.extract_collection(response.body, :read) }
      end

      action :find, 'GET /v1/cloud/images/:id' do
        handler(200) { |response| GodaddyApi::ImageMapping.extract_single(response.body, :read) }
      end

      action :create, 'POST /v1/cloud/images' do
        body { |object| GodaddyApi::ImageMapping.representation_for(:create, object) }
        handler(201, 202) { |response| GodaddyApi::ImageMapping.extract_single(response.body, :read) }
        # Error handling
        # handler(422) { |response| ErrorMapping.fail_with(FailedCreate, response.body) }
      end

      action :actions, 'GET /v1/cloud/images/:id/actions' do
        handler(200) { |response| ActionMapping.extract_collection(response.body, :read) }
      end

      action :destroy, 'POST /v1/cloud/images/:id/destroy' do
        handler(204) { |response| true }
      end
    end
  end
end

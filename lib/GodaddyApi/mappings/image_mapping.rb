module GodaddyApi
  class ImageMapping
    include Kartograph::DSL

    kartograph do
      mapping Image
      root_key plural: 'results', scopes: [:read]
      property :name, scopes: [:read, :create]
      property :imageId, scopes: [:read]
      property :version, scopes: [:read]
      property :status, scopes: [:read]
      property :sizeMb, scopes: [:read]
      property :rootImage, scopes: [:read]
      property :type, scopes: [:read]

      property :sourceServerId, scopes: [:create]
    end
  end
end

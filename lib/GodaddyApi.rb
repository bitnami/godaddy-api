require 'GodaddyApi/version'
require 'resource_kit'
require 'kartograph'
require 'active_support/all'

module GodaddyApi
  # client
  autoload :Client, 'GodaddyApi/client'

  # errors
  module Errors
    autoload :Generic, 'GodaddyApi/errors'
    autoload :Unauthorized, 'GodaddyApi/errors'
    autoload :NotFound, 'GodaddyApi/errors'
    autoload :Duplicate, 'GodaddyApi/errors'
    autoload :InternalError, 'GodaddyApi/errors'
  end

  # models
  autoload :Base, 'GodaddyApi/models/base'
  autoload :Action, 'GodaddyApi/models/action'
  autoload :Image, 'GodaddyApi/models/image'
  autoload :Key, 'GodaddyApi/models/key'
  autoload :Limit, 'GodaddyApi/models/limit'
  autoload :Server, 'GodaddyApi/models/server'
  autoload :Spec, 'GodaddyApi/models/spec'

  # mappings
  autoload :ActionMapping, 'GodaddyApi/mappings/action_mapping'
  autoload :ImageMapping, 'GodaddyApi/mappings/image_mapping'
  autoload :KeyMapping, 'GodaddyApi/mappings/key_mapping'
  autoload :LimitMapping, 'GodaddyApi/mappings/limit_mapping'
  autoload :ServerMapping, 'GodaddyApi/mappings/server_mapping'
  autoload :SpecMapping, 'GodaddyApi/mappings/spec_mapping'

  # resources
  autoload :ResourceHelper, 'GodaddyApi/resources/resource_helper'
  autoload :ImageResource, 'GodaddyApi/resources/image_resource'
  autoload :KeyResource, 'GodaddyApi/resources/key_resource'
  autoload :LimitResource, 'GodaddyApi/resources/limit_resource'
  autoload :ServerResource, 'GodaddyApi/resources/server_resource'
  autoload :SpecResource, 'GodaddyApi/resources/spec_resource'
end

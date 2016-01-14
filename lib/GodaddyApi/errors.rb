require 'faraday'

module GodaddyApi
  module Errors
    class Generic < StandardError
      attr_reader :message, :code
      def initialize response, message: nil
        message ||= default_message
        json = JSON::parse(response.body) rescue {}
        message = json["message"] if message.nil? || message == ""
        @code = json["code"]
        @message = message
        super(@message)
      end

      def default_message
        nil
      end

      def to_s
        "#{message} (#{code})"
      end

      # helpers to standardize error handling
      def self.standard_error_codes
        standard_error_mapping.keys.sort
      end

      def self.standard_error_handle response
        fail standard_error_mapping[response.status], response
      end

      def self.standard_error_mapping
        {
          401 => Errors::Unauthorized,
          403 => Errors::Unauthorized,
          404 => Errors::NotFound,
          409 => Errors::Duplicate,
          422 => Errors::Unauthorized,
          500 => Errors::InternalError
        }
      end
    end

    class Unauthorized < Generic ; end
    class NotFound < Generic ; end
    class Duplicate < Generic ; end
    class InternalError < Generic ; end
  end
end

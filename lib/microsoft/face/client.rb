require 'faraday'
require 'faraday_middleware'


module Microsoft
  module Face
    class Client
      def self.stream_call method, path, attributes = nil
        @connection = Faraday.new(:url => Face.configuration.api_server) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP

        end

        @connection.send(method, path) do |req|
          req.headers['Ocp-Apim-Subscription-Key'] = Face.configuration.api_key
          req.headers['User-Agent'] = "Micosoft::Face Ruby Client v #{Microsoft::Face::VERSION}"
          req.headers['Content-Type'] = 'application/octet-stream'
          req.body = attributes
        end
      end

      def self.api_call method, path, attributes = nil
        @connection = Faraday.new(:url => Face.configuration.api_server) do |faraday|
          faraday.request  :json             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP

        end

        @connection.send(method, path) do |req|
          req.headers['Ocp-Apim-Subscription-Key'] = Face.configuration.api_key
          req.headers['User-Agent'] = "Micosoft::Face Ruby Client v #{Microsoft::Face::VERSION}"
          req.headers['Content-Type'] = 'application/json'
          req.body = attributes
        end
      end
    end
  end
end
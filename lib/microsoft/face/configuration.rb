module Microsoft
  module Face
    class Configuration
      attr_accessor :api_key, :api_server

      def initialize
        @api_key = nil
        @api_server = 'https://eastus2.api.cognitive.microsoft.com'
      end
    end
  end
end
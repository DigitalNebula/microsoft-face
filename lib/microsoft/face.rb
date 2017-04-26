require "microsoft/face/version"
require 'microsoft/face/configuration'
require 'microsoft/face/client'
require 'microsoft/face/detect'
require 'microsoft/face/person_group'
require 'microsoft/face/person'

module Microsoft
  module Face
    # store configuration as class variable
    class << self
      attr_writer :configuration
    end

    # access configuration or create new one
    def self.configuration
      @configuration ||= Configuration.new
    end

    # block to set configuration
    def self.configure
      yield(configuration)
    end


    def self.detect image_blob
      Detect.run_detection(image_blob)
    end

    def self.verify face_id_1, face_id_2
      Client.api_call(:post, '/face/v1.0/verify', {faceId1: face_id_1, faceId2: face_id_2}).body
    end
  end
end

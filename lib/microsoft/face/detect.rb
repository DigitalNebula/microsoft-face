module Microsoft
  module Face
    class Detect
      def self.run_detection image_blob
        Client.stream_call(:post, '/face/v1.0/detect?returnFaceId=true', image_blob).body
      end
    end
  end
end
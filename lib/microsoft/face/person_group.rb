module Microsoft
  module Face
    class PersonGroup
      def self.create id
        Client.api_call(:put, '/face/v1.0/persongroups/' + id, {name: id, userData: 'PLease delete. Created on ' + DateTime.now.to_s}).body
      end

      def self.train id
        Client.api_call(:post, '/face/v1.0/persongroups/' + id + '/train', nil).body
      end

      def self.training_status id
        Client.api_call(:get, '/face/v1.0/persongroups/' + id + '/training', nil).body
      end
    end
  end
end
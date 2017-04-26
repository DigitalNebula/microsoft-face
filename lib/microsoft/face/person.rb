module Microsoft
  module Face
    class Person
      def self.create id, person_name
        Client.api_call(:post, '/face/v1.0/persongroups/' + id + '/persons', {name: person_name, userData: 'PLease delete. Created on ' + DateTime.now.to_s}).body
      end

      def self.add_face group_id, person_id, image, left, top, width, height
        Client.stream_call(:post, "/face/v1.0/persongroups/#{group_id}/persons/#{person_id}/persistedFaces?targetFace=#{left},#{top},#{width},#{height}", image).body
      end
    end
  end
end
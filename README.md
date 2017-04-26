# Microsoft::Face

A gem which will allow you to do facial analysis using the Microsoft Cognitive Services Face API


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'microsoft-face'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install microsoft-face

## Configuration
```ruby
Microsoft::Face.configure do |config|
  config.api_key = ENV['MICROSOFT_API_KEY']
end
```

## Usage

```ruby
# read images into binary blob
image_blob1 = File.open('face1.jpg', 'rb') {|file| file.read }
image_blob2 = File.open('face2.jpg', 'rb') {|file| file.read }


# Microsoft requires us to detect the faces first. So we run them through the detection API
# And then get the biggest face detected in each image.
face_1_analysis = JSON.parse(Microsoft::Face.detect(image_blob1)).sort{|e| e['faceRectangle']['width']}.last #get largest face
face_id_1 = face_1_analysis['faceId']

# same for second image
face_2_analysis = JSON.parse(Microsoft::Face.detect(image_blob2)).sort{|e| e['faceRectangle']['width']}.last
face_id_2 = face_2_analysis['faceId']

# finally run the match
Microsoft::Face.verify(face_id_1, face_id_2)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/web-connect/microsoft-face. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


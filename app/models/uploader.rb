require 'carrierwave'
class Uploader < CarrierWave::Uploader::Base
  storage :file
  # Remember to create a migration!
end

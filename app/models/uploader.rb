require 'carrierwave'
class Uploader < CarrierWave::Uploader::Base
  storage :file
  # Remember to create a migration!

  def store_dir
    '../public/uploads'
  end
end

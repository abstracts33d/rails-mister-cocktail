# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  storage :fog
end

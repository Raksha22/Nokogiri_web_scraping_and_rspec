class ImageUploader < CarrierWave::Uploader::Base

  def filename
    "#{original_filename}.jpeg"
  end

  def cache_dir
    '/tmp/projectname-cache'
  end
end

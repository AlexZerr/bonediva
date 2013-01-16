require 'carrierwave/processing/mini_magick'

class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  require 'fog' 
  # Include RMagick or MiniMagick support:
   #include CarrierWave::RMagick
   #include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  #storage :s3
   storage :file

  #uploader = ImagesUploader.new
  #uploader.store!(my_file)
  #uploader.retrieve_from_store!(my_file.png) 
  
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/new/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

   def extension_white_list
     %w(jpg jpeg gif png)
   end


     version :thumb do
       process :resize_to_fill => [100,100]
     end
   #uploader.retrieve_from_store!(@picture)

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def default_url
    filename = [version_name, "missing.png"].compact.join("_")
    "/assets/attachments_missing/pictures/#{filename}"
  end

end

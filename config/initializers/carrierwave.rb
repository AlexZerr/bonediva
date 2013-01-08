CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIFYLQ35TN46SBRAQ',                        # required
    :aws_secret_access_key  => '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
',                        # required
   # :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
   # :hosts                  => 's3.example.com',             # optional, defaults to nil
   # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'bonediva_development'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.storage = :fog
end

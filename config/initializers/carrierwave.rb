CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJMQYD6WALCBUD4GA',                        # required
    :aws_secret_access_key  => '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',          # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
   # :hosts                  => 's3.example.com',             # optional, defaults to nil
   # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'bonediva'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.storage = :fog
end

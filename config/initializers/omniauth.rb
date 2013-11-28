Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '161006087321169', '9d85d898382e2918ebda024be392b1b3'
end

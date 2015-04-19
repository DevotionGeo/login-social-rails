OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '418105375034768', '73f0a02a32d552cf44265539030787f8'
  provider :twitter, 'Rve9TRGGZhf8bTKjMOXgEBks7', 'pNCg0ZaqTIHrBFE9xwlK23K3gr3SeQtDtv13gQMqjYkVz4jsyU'
end
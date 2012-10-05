Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, 'UrkKjYgZRhsYTGPQGozPhA', 'FlQHJija2i5bUi24sOsz3BBPS1LXRFaT8BLZAfoO8'
  # Line below works for local servers - not for pow
  # provider :twitter, ENV['UrkKjYgZRhsYTGPQGozPhA'], ENV['FlQHJija2i5bUi24sOsz3BBPS1LXRFaT8BLZAfoO8']
  
  OmniAuth.config.logger = Rails.logger
end
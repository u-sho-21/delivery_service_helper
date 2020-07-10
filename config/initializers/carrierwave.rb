unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAZDEXUGKSWZ6T2YVP',
      aws_secret_access_key: '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',
      region: 'rails-s3-01'
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end

FactoryBot.define do
  factory :token do
    # genera un token exadecimal
    # in console SecureRandom.hex
    token { SecureRandom.hex }
    expires_at { Faker::Date.in_date_period }
  end
end

FactoryBot.define do
  factory :owner do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
    age {rand(18..60)}
    # Así es como se añade la referencia belongs_to
    store
  end
end

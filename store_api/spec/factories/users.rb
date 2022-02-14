FactoryBot.define do
  factory :user do
    email { "pablo@correo.cl" }
    age { 26 }
    password_digest { "password" }
    type { "test" }
  end
end

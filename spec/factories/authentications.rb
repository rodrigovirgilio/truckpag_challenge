FactoryBot.define do
  factory :authentication do
    name { FFaker::Name.name }
    token { SecureRandom.hex }
  end
end

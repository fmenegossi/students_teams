FactoryBot.define do
  factory :match do
    date  { Faker::Date.between(Date.today, Date.today + 5.days) }
  end
end

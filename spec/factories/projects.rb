FactoryBot.define do
  factory :project do
    title {Faker::GreekPhilosophers.quote}
    description {Faker::Lorem.paragraph}
    association(:user, factory: :user)
  end
end

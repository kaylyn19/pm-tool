FactoryBot.define do
  factory :project do
    title {Faker::GreekPhilosophers.quote}
    description {Faker::Lorem.paragraph}
    due_date {Faker::Date.between(5.years.ago, Date.today)}
    association(:user, factory: :user)
  end
end

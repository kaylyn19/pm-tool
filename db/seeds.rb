# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.delete_all

10.times do
    datetime = Faker::Date.backward(365 * 5)
    Project.create(
        title: Faker::Lorem.word,
        description: Faker::Lorem.paragraph(rand(3..6)),
        due_date: Faker::Date.between(5.years.ago, Date.today),
        created_at: datetime,
        updated_at: datetime
    )
end

p "#{Project.all.count} projects are generated"
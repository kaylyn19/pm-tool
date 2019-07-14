# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Comment.delete_all
Discussion.delete_all
Task.delete_all
Project.delete_all

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
      password: 'password'
    )
end

10.times do
    datetime = Faker::Date.backward(365 * 5)
    p = Project.create(
        title: Faker::Lorem.word,
        description: Faker::Lorem.paragraph(rand(3..6)),
        due_date: Faker::Date.between(5.years.ago, Date.today),
    )
    if p.valid?
        p.tasks = rand(1..4).times.map do
            Task.new(
                title: Faker::GreekPhilosophers.quote,
                description: Faker::Lorem.paragraph,
                due_date: Faker::Date.between(5.years.ago, Date.today),
                complete:Faker::Boolean.boolean(0.4),
                project: p
            )
        end

        # p.discussions = rand(1..4).times.map do
        #     d = Discussion.new(
        #         title: Faker::GreekPhilosophers.quote,
        #         description: Faker::Lorem.paragraph(3),
        #         project: p,
        #     )
        #     if d.valid?
        #         d.comments = rand(1..10).times.map do
        #             Comment.new(
        #                 body: Faker::ChuckNorris.fact,
        #                 discussion: d
        #             )
        #         end
        #     end
        # end
    end
end

p "#{Project.all.count} projects are generated"
p "#{Task.all.count} tasks are generated"
p "#{Discussion.all.count} discussions are generated"
# p "#{Comment.all.count} comments are generated"
p "#{User.all.count} user are generated"
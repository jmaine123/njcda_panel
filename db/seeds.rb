# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
admin = User.create({
  first_name: 'Carl',
  last_name: 'Smikle',
  age: 66,
  email: 'carl@aol.com',
  password: '123',
  auth_code: '1234',
  admin: true
  })

courses = Course.create(
  {
  name: 'React.js',
  total_hours: '500',
  description: 'Learning React.js framework at a beginners level'
}
)

cohort = Cohort.create(
  {
    name: 'Faker'
  }
)

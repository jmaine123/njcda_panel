# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

admin = User.create({
  first_name: 'Roderick',
  last_name: 'Smikle',
  age: 66,
  email: 'rod@aol.com',
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
    name: 'React for beginners',
    max_students: 28,
    days_per_week: 5,
    course_id: courses.id,
    start_date: '2020-01-02 00:00:00',
    end_date: '2020-04-06 00:00:00'
  }
)

education = ['High School', 'College', 'Bachelors', 'Masters']

  4.times do
    student = Student.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: rand(18..100),
        email: Faker::Internet.email,
        phone_number:'201'+ rand.to_s[2..8],
        education: education[rand(0..3)],
        course_id: courses.id,
        cohort_id: cohort.id,
    )
    student.email = Faker::Internet.email(student.first_name)
    student.save
  end

  instructor = Instructor.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      age: rand(18..100),
      salary: rand(40000..150000),
      email: Faker::Internet.email,
      phone_number:'201'+ rand.to_s[2..8],
      education: education[rand(0..3)],
      course_id: courses.id,
      cohort_id: cohort.id,
  )
  instructor.email = Faker::Internet.email(instructor.first_name)
  instructor.employee_id = instructor.generate_instructor_id
  instructor.save

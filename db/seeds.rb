# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

admin = User.create({
  first_name: 'Jasmine',
  last_name: 'Smikle',
  age: 66,
  email: 'jasminesmikle@aol.com',
  password: '123',
  auth_code: '1234',
  admin: true
  })

12.times do

    course = Course.create(
      {
      name: Faker::ProgrammingLanguage.name,
      total_hours: rand(40..100),
      description: 'Beginner level course'
    }
    )

    cohort = Cohort.create(
      {
        name: "#{course.name} Summer 101 ",
        max_students: rand(20..50),
        days_per_week: rand(1..7),
        course_id: course.id,
        start_date: '2020-01-06 00:00:00',
        end_date: '2020-04-08 00:00:00'
      }
    )

    education = ['High School', 'College', 'Bachelors', 'Masters']

      20.times do
        student = Student.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            age: rand(18..100),
            email: Faker::Internet.email,
            phone_number:'201'+ rand.to_s[2..8],
            education: education[rand(0..3)],
            course_id: course.id,
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
          course_id: course.id,
          cohort_id: cohort.id,
      )
      instructor.email = Faker::Internet.email(instructor.first_name)
      instructor.employee_id = instructor.generate_instructor_id
      instructor.save
end

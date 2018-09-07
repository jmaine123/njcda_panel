class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy
  has_many :students, through: :cohorts
  has_many :instructors, through: :cohorts
end

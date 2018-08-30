class Cohort < ApplicationRecord
  belongs_to :course
  has_many :students
  has_many :instructors
end

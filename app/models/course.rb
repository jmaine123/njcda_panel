class Course < ApplicationRecord
  has_many :cohorts
  has_many :students through :cohorts
  has_many :instructors through :cohorts
end

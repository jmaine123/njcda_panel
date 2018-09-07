class Cohort < ApplicationRecord
  belongs_to :course
  has_many :students, dependent: :destroy
  has_one :instructor, dependent: :destroy
end

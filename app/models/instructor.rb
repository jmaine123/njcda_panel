class Instructor < ApplicationRecord
  validates :email, uniqueness: true
  validates :age, numericality: { less_than: 150, greater_than: 18 }
  belongs_to :cohort

  def full_name
    self.first_name + " " + self.last_name
  end
end

class Instructor < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :email, uniqueness: true
  validates :age, numericality: { less_than: 150, greater_than: 18 }
  validates :salary, numericality:{greater_than: 0}
  belongs_to :cohort

  def full_name
    self.first_name + " " + self.last_name
  end
end

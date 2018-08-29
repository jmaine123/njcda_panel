class Instructor < ApplicationRecord
  validates :email, uniqueness: true
  validates :age, numericality: { less_than: 150 }
  validates :age, numericality: { greater_than: 18 }
  
  def full_name
    self.first_name + " " + self.last_name
  end
end

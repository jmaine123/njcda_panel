class Student < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :email, uniqueness: true
  validates :age, numericality: { less_than: 150, greater_than: 18 }
  belongs_to :cohort


  def full_name
    self.first_name + " " + self.last_name
  end

  def generate_student_id
    self.student_id = SecureRandom.uuid
  end
end

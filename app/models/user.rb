class User < ApplicationRecord
  before_save {self.email = email.downcase}


  def full_name
    self.first_name + ' '+ self.last_name
  end

  def type_of_user
    admin =  '1234'
    instructor = 'abcd'
    student = 'abc123'
    if self.auth_code === admin
      self.admin = true
    elsif self.auth_code === instructor
      self.admin = false
      self.instructor = true
      self.student = false
    elsif self.auth_code === student
      self.student = true
      self.instructor = false
      self.admin = false
    end
  end
end

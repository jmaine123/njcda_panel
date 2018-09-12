class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password
  validates :password, presence: true
  validates :email, presence: true, length: {maximum: 100}

  def full_name
    self.first_name + ' '+ self.last_name
  end

  def User.digest(string)
    cost = Active::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                                             BCrypt::Engine.min_cost
    BCrypt::Password.create(string, :cost, cost)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def type_of_user
    admin =  '1234'
    instructor = 'abcd'
    student = 'abc123'
    if self.auth_code === admin
      self.admin = true
      self.instructor = false
      self.student = false
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

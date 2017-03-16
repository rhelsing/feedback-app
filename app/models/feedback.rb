class Feedback < ApplicationRecord
  attr_accessor :token

  def self.users
    eval(ENV['EMPLOYEES'])
  end

  validates :token, inclusion: { in: Feedback.users.keys }
  before_save :assign_user

  def assign_user
    self.user = Feedback.users[@token]
  end


  def self.generate_token
    SecureRandom.urlsafe_base64.first(8)
  end

end

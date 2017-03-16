class Feedback < ApplicationRecord
  attr_accessor :token

  def self.users
    JSON.parse(ENV['EMPLOYEES'])
  end

  validates :token, inclusion: { in: Feedback.users.keys }
  before_save :assign_user

  def assign_user
    self.user = Feedback.users[@token]
  end
end

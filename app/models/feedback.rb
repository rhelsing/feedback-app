class Feedback < ApplicationRecord
  attr_accessor :token

  def self.users
    {
      "h828hd2" => "Ryan H",
      "dg828gd" => "Steve H",
    }
  end

  validates :token, inclusion: { in: Feedback.users.keys }
  before_save :assign_user

  def assign_user
    self.user = Feedback.users[@token]
  end
end

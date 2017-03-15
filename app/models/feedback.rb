class Feedback < ApplicationRecord
  attr_accessor :token

  def self.users
    {
      "9569d8a4" => "Ryan H",
      "bd14fa3f" => "Steve H",
      "5acc394b" => "Blair R",
      "fdfefe1f" => "Mariah H",
      "8ca68037" => "Daniel B",
      "422d906e" => "Rickard S",
      "1fc3f873" => "Joe W",
      "51f57643" => "David E",
      "680a3d39" => "Chartana V",
      "8efcee63" => "Matt O",
      "55140da4" => "Will J"
    }
  end

  validates :token, inclusion: { in: Feedback.users.keys }
  before_save :assign_user

  def assign_user
    self.user = Feedback.users[@token]
  end
end

class Account < ActiveRecord::Base
  belongs_to :user

  validate :age_is_between_20_and_100
  validates :gender, inclusion: { in: %w( male female N/A ), message: "%{value} is not a valid gender!" }

  def age_is_between_20_and_100
    if (age < 20 || age > 100)
      errors.add(age.to_s, "is not between 20 and 100!")
    end
  end

end

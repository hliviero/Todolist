class Profile < ActiveRecord::Base
  belongs_to :user

  validate :name_validate, :gender_validate
 validates_inclusion_of :gender, :in => %w( male female )

  def name_validate
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "Can't be null")
    end
  end

  def gender_validate
    if gender == "male" && first_name == "Sue"
      errors.add(:gender, "Male cannot be called Sue")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? and ?", min, max).order(birth_year: :asc)
  end
end

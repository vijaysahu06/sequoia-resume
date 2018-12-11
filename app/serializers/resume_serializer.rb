class ResumeSerializer < ActiveModel::Serializer
  has_many :experiences
  has_many :educations

  attributes :id, :name, :email, :phone, :reffered_by, :what_do_you_like, :willing_to_relocate, :preferred_location, :experience_in_years, :experience_in_months, :level, :industry, :additional_industry, :function, :linkedin_link, :resume, :experiences, :educations


  # def experiences
  #   # binding.pry
  # end

  # def educations
    
  # end
end

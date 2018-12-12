class Api::ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :location, :start_date, :end_date, :is_current, :description, :resume_id
end

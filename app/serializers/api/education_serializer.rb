class Api::EducationSerializer < ActiveModel::Serializer
  attributes :id, :university, :qualification, :year, :resume_id
end

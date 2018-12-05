class Resume < ApplicationRecord
	has_many :educations
	has_many :experiences
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
end

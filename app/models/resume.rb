class Resume < ApplicationRecord
	has_many :educations
	has_many :experiences
end

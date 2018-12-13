class Education < ApplicationRecord
	belongs_to :resume

  scope :highest, -> { order("year DESC").try(:first) }
end

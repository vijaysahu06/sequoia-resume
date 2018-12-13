class Experience < ApplicationRecord
	belongs_to :resume

  scope :current, -> { where(is_current: true).try(:first) }
end

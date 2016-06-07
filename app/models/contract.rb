class Contract < ActiveRecord::Base
  # Associations
  belongs_to :company
  belongs_to :candidate
end

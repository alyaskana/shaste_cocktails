class Tag < ApplicationRecord
  extend Enumerize

  enumerize :tag_type, in: [:taste, :goal]

  validates :name, :presence => true
end

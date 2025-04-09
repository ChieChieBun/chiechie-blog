class Tag < ApplicationRecord
  has_many :journals, through: :journal_tag_relationships
  has_many :journal_tag_relationships
end

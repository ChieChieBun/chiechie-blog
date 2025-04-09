class Journal < ApplicationRecord
has_many :tags, through: :journal_tag_relationships
has_many :journal_tag_relationships
has_many :comments
end

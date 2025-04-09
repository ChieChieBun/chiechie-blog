class Journal < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :journal_tag_relationships
  has_many :journal_tag_relationships
  has_many :comments
end

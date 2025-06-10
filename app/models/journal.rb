class Journal < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :journal_tag_relationships, dependent: :delete_all
  has_many :tags, through: :journal_tag_relationships
  has_many :comments, dependent: :delete_all

end

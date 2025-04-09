class JournalTagRelationship < ApplicationRecord
  belongs_to :journal
  belongs_to :tag
end

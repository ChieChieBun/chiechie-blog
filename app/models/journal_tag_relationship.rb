class JournalTagRelationship < ApplicationRecord
  belongs_to :tag
  belongs_to :journal

end

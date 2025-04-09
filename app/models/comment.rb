class Comment < ApplicationRecord
  belongs_to :journal
  has_many :comment_replies
end

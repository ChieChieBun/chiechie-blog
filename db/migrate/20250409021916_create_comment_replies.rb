class CreateCommentReplies < ActiveRecord::Migration[8.0]
  def change
    create_table :comment_replies do |t|
      t.references :comment, null: false, foreign_key: true
      t.string :comment_reply_text, null: false
      t.timestamps
    end
  end
end

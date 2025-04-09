class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :journal, null: false, foreign_key: true
      t.string :comment_reply_text, null: false, foreign_key: true
      t.timestamps
    end
  end
end

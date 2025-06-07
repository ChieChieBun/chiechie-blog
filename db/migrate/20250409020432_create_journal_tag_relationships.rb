class CreateJournalTagRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :journal_tag_relationships do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :journal, null: false, foreign_key: true
      t.timestamps
    end
  end
end

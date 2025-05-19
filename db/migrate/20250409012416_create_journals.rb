class CreateJournals < ActiveRecord::Migration[8.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :entry
      t.boolean :private
      t.references :categories, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end

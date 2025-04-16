class DropPrivacy < ActiveRecord::Migration[8.0]
  def change
    drop_table :privacy_statuses
  end
end

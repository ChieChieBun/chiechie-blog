class CreatePrivacyStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :privacy_statuses do |t|
      t.string :privacy_status
      t.timestamps
    end
  end
end

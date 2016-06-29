class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :recipient_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

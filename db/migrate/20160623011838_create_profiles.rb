class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :about
      t.string :twitter
      t.string :github
      t.string :linkedin
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

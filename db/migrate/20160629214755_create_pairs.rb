class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :recipient_id
      t.integer :giver_id
      t.references :trade
      t.timestamps null: false
    end
  end
end

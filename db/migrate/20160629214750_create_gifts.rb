class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.boolean :bought
      t.references :pair
      t.timestamps null: false
    end
  end
end

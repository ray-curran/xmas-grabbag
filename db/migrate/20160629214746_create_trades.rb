class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :year
      t.timestamps null: false
    end
  end
end

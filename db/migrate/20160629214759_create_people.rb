class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.references :family
      t.string :name
      t.string :adult_or_kid
      t.date :birthday
      t.timestamps null: false
    end
  end
end

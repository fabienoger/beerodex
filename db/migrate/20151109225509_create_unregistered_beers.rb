class CreateUnregisteredBeers < ActiveRecord::Migration
  def change
    create_table :unregistered_beers do |t|
      t.string :name
      t.integer :degrees
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

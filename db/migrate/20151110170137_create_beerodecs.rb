class CreateBeerodecs < ActiveRecord::Migration
  def change
    create_table :beerodecs do |t|
      t.references :beer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

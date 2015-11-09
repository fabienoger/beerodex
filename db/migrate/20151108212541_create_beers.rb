class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :degrees
      t.text :technical_sheet
      t.integer :quality_hangover
      t.string :country

      t.timestamps null: false
    end
  end
end

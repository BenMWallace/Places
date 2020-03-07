class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.integer :owner_id
      t.string :name
      t.text :description
      t.datetime :datetime_start
      t.datetime :datetime_end
      t.string :address

      t.timestamps
    end
  end
end

class CreateLands < ActiveRecord::Migration[7.1]
  def change
    create_table :lands do |t|
      t.integer :area
      t.references :user, null: false, foreign_key: true
      t.string :local_attractions
      t.string :address

      t.timestamps
    end
  end
end

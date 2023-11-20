class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :estate_value, :float
  end
end

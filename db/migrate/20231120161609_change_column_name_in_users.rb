class ChangeColumnNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :type, :species
  end
end

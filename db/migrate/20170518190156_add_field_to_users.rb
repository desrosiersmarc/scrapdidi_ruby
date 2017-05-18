class AddFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :mobil_phone, :string
    add_column :users, :birth_date, :date
    add_column :users, :newsletter, :boolean
    add_column :users, :loyalty, :boolean
  end
end

class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.datetime :birthdate
      t.string :email

      t.timestamps
    end
  end
end

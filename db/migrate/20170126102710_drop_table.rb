class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :families
    drop_table :subfamilies
  end
end

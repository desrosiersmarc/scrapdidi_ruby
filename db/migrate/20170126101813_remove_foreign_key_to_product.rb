class RemoveForeignKeyToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :subfamily_id, :string
  end
end

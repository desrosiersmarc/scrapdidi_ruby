class AddHomeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :home, :string
  end
end

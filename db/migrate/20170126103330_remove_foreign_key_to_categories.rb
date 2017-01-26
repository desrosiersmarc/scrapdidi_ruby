class RemoveForeignKeyToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :categories, column: :product_id
  end
end

class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.string :name
      t.references :subfamily, foreign_key: true

      t.timestamps
    end
  end
end

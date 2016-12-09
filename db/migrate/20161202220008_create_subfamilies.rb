class CreateSubfamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :subfamilies do |t|
      t.string :name

      t.timestamps
    end
  end
end

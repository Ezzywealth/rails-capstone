class Categories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end

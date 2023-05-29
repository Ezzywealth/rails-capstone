class OperationCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :operation_category do |t|
      t.string :operations, null: false, foreign_key: true
      t.string :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end

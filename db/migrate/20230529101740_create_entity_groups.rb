class CreateEntityGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_groups do |t|
      t.string :group, null: false, foreign_key: true
      t.string :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end

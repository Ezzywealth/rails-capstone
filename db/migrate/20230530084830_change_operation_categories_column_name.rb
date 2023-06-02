class ChangeOperationCategoriesColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :operation_categories, :categories_id, :category_id
    rename_column :operation_categories, :operations_id, :operation_id
  end
end

class ChangeOperationCategoryToOperationCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :operation_category, :operation_categories
  end
end

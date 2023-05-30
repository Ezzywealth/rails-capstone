class ChangeOperationCategoriesColumnsName < ActiveRecord::Migration[7.0]
  def change
    rename_column :operation_categories, :categories, :categories_id
    rename_column :operation_categories, :operations, :operations_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

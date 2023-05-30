class ChangeCategoryColumnAuthorIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :author_id, :user_id
  end
end

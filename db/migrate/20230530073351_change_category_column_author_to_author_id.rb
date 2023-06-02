class ChangeCategoryColumnAuthorToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :author, :author_id
  end
end

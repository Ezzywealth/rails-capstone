class ChangeOperationColumnFromAuthorToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :operations, :author, :user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

class ChangeCategoryIconToText < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :categories, :image, :text
    end

    def down
      change_column :categories, :image, :string
    end
  end
end

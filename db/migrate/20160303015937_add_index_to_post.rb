class AddIndexToPost < ActiveRecord::Migration
  def change
    add_index :posts, [:deleted_at, :created_at]
  end
end

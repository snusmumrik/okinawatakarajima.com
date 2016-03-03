class AddIndexToImage < ActiveRecord::Migration
  def change
    add_index :images, :imageable_id
  end
end

class AddDeleteKeyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :delete_key, :string, after: :email
  end
end

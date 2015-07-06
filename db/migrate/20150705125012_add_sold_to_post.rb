class AddSoldToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sold, :boolean, after: :email
  end
end

class AddTelToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tel, :string, after: :email
  end
end

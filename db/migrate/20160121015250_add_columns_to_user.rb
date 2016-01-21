class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string, after: :tel
    add_column :users, :site, :string, after: :address
    add_column :users, :business_hour, :string, after: :site
    add_column :users, :holiday, :string, after: :business_hour
  end
end

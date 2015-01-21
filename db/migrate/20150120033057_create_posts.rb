class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :board, index: true
      t.string :title
      t.text :text
      t.string :name
      t.string :email
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_foreign_key :posts, :boards
  end
end

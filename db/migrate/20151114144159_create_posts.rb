class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.string :author
      t.string :category

      t.timestamps null: false
    end
  end
end

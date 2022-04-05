class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.integer :member_id
      t.integer :machine_id
      t.string :post_image
      t.text :sentence
      t.timestamps
    end
  end
end

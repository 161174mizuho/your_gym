class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.integer :admin_id
      t.string :site_name
      t.timestamps
    end
  end
end

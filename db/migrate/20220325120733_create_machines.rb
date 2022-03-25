class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.integer :admin_id
      t.integer :site_id
      t.string :machine_name
      t.string :machine_image
      t.text :explanation
      t.integer :machine_status, default: 0
      t.timestamps
    end
  end
end

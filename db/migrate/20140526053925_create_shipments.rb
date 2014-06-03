class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :shipments, [:user_id, :created_at]
  end
end

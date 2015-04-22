class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :sub_total
      t.integer :tax
      t.string :status

      t.timestamps null: false
    end
  end
end

class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true
      t.integer :quantity
      t.integer :markup

      t.timestamps null: false
    end
    add_foreign_key :line_items, :products
    add_foreign_key :line_items, :orders
  end
end

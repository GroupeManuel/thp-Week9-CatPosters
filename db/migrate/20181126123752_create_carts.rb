class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :status
      t.belongs_to :artisan, index: true
      t.decimal :total_price

      t.timestamps
    end
  end
end

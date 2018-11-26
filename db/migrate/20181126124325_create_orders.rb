class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :artisan, index: true
      t.string :status
      t.string :delivery_address
      t.string :delivery_choice
      t.string :payment_method
      t.string :payment_id
      t.string :total_price

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :dimensions
      t.string :weigth
      t.decimal :price
      t.string :item_type

      t.timestamps
    end
  end
end

class CreateDataFeeds < ActiveRecord::Migration
  def change
    create_table :data_feeds do |t|
      t.integer :merchant_id
      t.integer :product_id
      t.date :date_created
      t.date :date_modified
      t.string :sku
      t.string :name
      t.string :category
      t.text :description
      t.text :target_url
      t.text :image_url
      t.text :avatar_url
      t.integer :price
      t.string :barnd
      t.string :colour
      t.string :currency
      t.string :gender
    end
  end
end

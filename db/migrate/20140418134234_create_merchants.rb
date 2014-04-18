class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :merchant_id
      t.date :date_created
      t.date :date_modified
      t.string :name
      t.text :avatar_path
      t.integer :items_count
    end
  end
end

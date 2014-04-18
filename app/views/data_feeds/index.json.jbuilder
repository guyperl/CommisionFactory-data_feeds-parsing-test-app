json.array!(@data_feeds) do |data_feed|
  json.extract! data_feed, :id, :merchant_id, :product_id, :date_created, :date_modified, :sku, :name, :category, :description, :target_url, :image_url, :avatar_url, :price, :barnd, :colour, :currency, :gender
  json.url data_feed_url(data_feed, format: :json)
end

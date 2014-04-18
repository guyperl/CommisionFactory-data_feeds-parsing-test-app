json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :merchant_id, :date_created, :date_modified, :name, :avatar_path, :items_count
  json.url merchant_url(merchant, format: :json)
end

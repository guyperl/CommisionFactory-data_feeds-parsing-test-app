class ChangeCollumnPriceInDataFeeds < ActiveRecord::Migration
  def change
    change_column(:data_feeds, :price, :string)
  end
end

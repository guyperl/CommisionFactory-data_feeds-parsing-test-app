class Merchant < ActiveRecord::Base
  has_many :data_feeds
end

ActiveAdmin.register DataFeed do

  action_item do
    link_to 'Import DataFeed', import_data_feeds_admin_data_feeds_path
  end

  index do
    column :name
    column :sku
    # column :product_id
    column :category
    column(:description){ |obj| truncate( obj.description, length: 50) }
    column :target_url
    column :price
    column :barnd
    column :colour
    column :currency
    column :gender
    column(:image_url) do |obj| 
      image_tag(obj.image_url, :height => '100')
    end
    column(:avatar_url) do |obj| 
      image_tag(obj.avatar_url, :height => '100')
    end
    column :date_created
    column :date_modified
  end


 
  collection_action :import_data_feeds do
    Merchant.all.each do |merchant|
    #[ Merchant.first ].each do |merchant|
      Feedster.new().get_data_feeds(merchant.merchant_id).map do |data_feed| 

        feed = DataFeed.find_or_initialize_by(sku: data_feed['SKU'], price: data_feed['Price'])

        feed.update({
          :merchant_id   => merchant.id,
          :product_id    => data_feed['Id'],
          :date_created  => data_feed['DateCreated'],
          :date_modified => data_feed['DateModified'],
          :sku           => data_feed['SKU'],
          :name          => data_feed['Name'],
          :category      => data_feed['Category'],
          :description   => data_feed['Description'],
          :target_url    => data_feed['TargetUrl'],
          :image_url     => data_feed['ImageUrl'],
          :avatar_url    => data_feed['Image200Url'],
          :price         => data_feed['Price'],
          :barnd         => data_feed['Brand'],
          :colour        => data_feed['Colour'],
          :currency      => data_feed['Currency'],
          :gender        => data_feed['Gender']
        })
      end
    end
    redirect_to admin_data_feeds_path
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :merchant_id, :product_id, :date_created, :date_modified, :sku, :name, :category, :description, :target_url, :image_url, :avatar_url, :price, :barnd, :colour, :currency, :gender
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end

ActiveAdmin.register Merchant do

  action_item do
    link_to 'Import Merchants', import_merchants_admin_merchants_path
  end

  index do
    column :name
    # column :merchant_id
    column :items_count
    column(:avatar) do |obj| 
      image_tag(obj.avatar_path, :height => '100')
    end
    column :date_created
    column :date_modified
  end
 
  collection_action :import_merchants do
    Feedster.new().get_merchants.map do |merchant| 
      merch = Merchant.find_or_initialize_by(name: merchant['MerchantName'])
      merch.update({
        :merchant_id   => merchant['MerchantId'],
        :date_created  => merchant['DateCreated'],
        :date_modified => merchant['DateModified'],
        :name          => merchant['MerchantName'],
        :avatar_path   => merchant['MerchantAvatarUrl'],
        :items_count   => merchant['ItemsCount']
      })
    end
    redirect_to admin_merchants_path
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :merchant_id, :date_created, :date_modified, :name, :avatar_path, :items_count
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end

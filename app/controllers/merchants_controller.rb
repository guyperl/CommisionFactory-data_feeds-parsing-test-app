class MerchantsController < InheritedResources::Base
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant  = Merchant.find(params[:id])
    @data_feeds = @merchant.data_feeds.order("date_modified DESC").page params[:page]
  end
end

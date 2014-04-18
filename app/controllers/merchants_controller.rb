class MerchantsController < InheritedResources::Base
  def index
    @merchants = Merchant.all
  end
end

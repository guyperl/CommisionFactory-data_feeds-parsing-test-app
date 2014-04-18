class DataFeedsController < InheritedResources::Base
  def index
    @q = DataFeed.search(params[:q])
    @data_feeds = @q.result(distinct: true)
  end
end

class DataFeedsController < InheritedResources::Base
  def index
    @q = DataFeed.order("date_modified DESC").search(params[:q])
    @data_feeds = @q.result(distinct: true).page params[:page]
  end
end

class EventPresenter

  def initialize(search_params)
    @search_params = search_params
  end

  def events
    if @search_params
      Event.search(@search_params).order("time ASC")
    else
      Event.order("time ASC")
    end
  end
end

class EventPresenter
  attr_reader :service, :params

  def initialize(params)
    @params = params
    @service = EventfulService.new
  end

  def events
    if find_events.class == Array
      @events = find_events.sort{|e, f| e.start_time <=> f.start_time }
    else
      @events
    end
  end

  def find_events
    if params[:search]
      Event.all(params[:category], params[:search], format_search_time)
    else
      Event.all
    end
  end

  def format_search_time
    Event.search_time(params[:date][:month],
                      params[:date][:day],
                      params[:date][:year])
  end
end

class EventPresenter

  def initialize(params)
    @params = params
  end

  def events
    if @params[:search]
    @events = Event.all(@params[:category],
                        @params[:search],
                        Event.search_time(@params[:date][:month], @params[:date][:day], @params[:date][:year])
                        ).sort{|e, f| e.start_time <=> f.start_time }
    else
      @events = Event.all
    end
  end
end

class EmailJob
  include SuckerPunch::Job

  def perform(user, itinerary)
    @user = user
    @itinerary = itinerary
    UserMailer.notify(@user, @itinerary).deliver_now
  end
end

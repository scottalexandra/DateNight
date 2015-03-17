class UserMailer < ApplicationMailer
  def notify(user, itinerary)
    @user = user
    @itinerary = itinerary
    mail(to: @user.email, subject: "#{@itinerary.title} Itinerary")
  end
end

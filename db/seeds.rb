class Seed
  def initialize
    build_images
    build_events
  end

  def build_images
    10.times do
      Image.create(url: "event-image.jpg", caption: "This is the event of the season!")
    end
  end

  def build_events
    i = 1
    10.times do
      Event.create(title: Faker::Company.catch_phrase,
                   url: Faker::Internet.url,
                   description: Faker::Company.catch_phrase,
                   time: Faker::Time.between(2.days.ago, Time.now, :all),
                   place: Faker::Company.name,
                   address: Faker::Address.street_address,
                   city: Faker::Address.city,
                   state: Faker::Address.state,
                   postal_code: Faker::Address.zip,
                   country: Faker::Address.country,
                   image_id: i
                   )
      i = i + 1
    end
  end
end

Seed.new

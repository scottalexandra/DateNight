class Seed
  def initialize
    build_events
  end

  def build_events
    3.times do
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
                   latitude: Faker::Address.latitude,
                   longitude: Faker::Address.longitude,
                   image: "event-image.jpg",
                   )
    end
    3.times do
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
                   image: "event-image.jpg",
                   latitude: Faker::Address.latitude,
                   longitude: Faker::Address.longitude,
                   image: "event-image.jpg"
                   )
    end
    4.times do
      Event.create(title: Faker::Company.catch_phrase,
                   url: Faker::Internet.url,
                   description: Faker::Company.catch_phrase,
                   time: Faker::Time.between(2.days.ago, Time.now, :all),
                   place: Faker::Company.name,
                   address: Faker::Address.street_address,
                   city: "Denver",
                   state: "Colorado",
                   postal_code: Faker::Address.zip,
                   country: Faker::Address.country,
                   latitude: "39.749",
                   longitude: "-105.000",
                   image: "event-image.jpg"
                   )
    end
  end
end

Seed.new

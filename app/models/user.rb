class User < ActiveRecord::Base
  validates_presence_of :name, :provider, :uid, :email
  has_many :itineraries
  
  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid).tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end
end

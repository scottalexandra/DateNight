class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
  end
end

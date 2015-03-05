require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "#create" do
    before(:each) do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
    end
    scenario "it creates a user from google data" do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider => "google_oauth2",
        :info => { :name => "Murphy Robinson", :email => "murphy.robinson3@gmail.com" },
        :uid => "123127235098235"
      })
      post :create
      expect(assigns(:user).name).to eq("Murphy Robinson")
    end

    scenario "it doesn't create a duplicate user" do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider => "google_oauth2",
        :info => { :name => "Murphy Robinson", :email => "murphy.robinson3@gmail.com" },
        :uid => "123127235098235"
      })

      User.create(provider: "google_oauth2",
                  name: "Murphy Robinson",
                  email: "murphy.robinson3@gmail.com",
                  uid: "123127235098235")
      post :create
      expect(User.count).to eq(1)
    end
  end
end

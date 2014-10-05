require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET index" do
    it "Response to 200 OK." do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end

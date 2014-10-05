require 'rails_helper'

RSpec.describe "Welcome", :type => :request do
  describe "GET /welcome" do
    it "works." do
      get welcome_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "ApiDetails", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api_details/show"
      expect(response).to have_http_status(:success)
    end
  end

end

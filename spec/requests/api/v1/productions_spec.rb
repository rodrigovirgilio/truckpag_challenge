require "rails_helper"

RSpec.describe "Api::V1::Productions", type: :request do
  describe "GET /index" do
    let(:authentication) { create(:authentication) }
    let(:product) { create(:product) }

    it "returns a ok status" do
      get "/api/v1/products", headers: { Authorization: authentication.token }

      expect(response).to have_http_status(:ok)
    end

    it "invalid token" do
      get "/api/v1/products", headers: { Authorization: "1234" }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /show" do
    let(:authentication) { create(:authentication) }
    let(:product) { create(:product, code: 123456) }

    it "returns a ok status" do
      get "/api/v1/products/#{product.code}",
        headers: { Authorization: authentication.token }

      expect(response).to have_http_status(:ok)
    end

    it "invalid token" do
      get "/api/v1/products", headers: { Authorization: "1234" }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "PUT /api/v1/products/:code" do
    let(:product) { create(:product) }
    let(:authentication) { create(:authentication) }

    let(:product_params) do
      {
        code: 123456
      }
    end

    it "valid products attributes" do
      put "/api/v1/products/#{product.code}",
        params: product_params, headers: { Authorization: authentication.token }

      expect(response).to have_http_status(:success)

      expect(product_params[:code]).to eq(123456)
    end
  end

  describe "when authentication token is not valid" do
    let(:product) { create(:product) }
    let(:authentication) { create(:authentication) }

    let(:product_params) do
      {
        code: 123456
      }
    end

    it "invalid token" do
      put "/api/v1/products/#{product.id}",
        params: product_params, headers: { Authorization: "1234" }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end

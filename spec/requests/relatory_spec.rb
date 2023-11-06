require 'rails_helper'

RSpec.describe "Relatories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/relatory/index"
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe "Api::V1::Companies" do
  describe "GET #index", :type => :request do
    let!(:companies) {FactoryBot.create_list(:company, 20)}

    before do
      get "/api/v1/companies"
    end
    
    it "return http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns all companies' do
      expect(JSON.parse(response.body).size).to eq(20)
    end

    it "returns correct setof data" do 
      expect(JSON.parse(response.body).first).to include("id", "name", "code")
    end
  end
end

require 'rails_helper'

RSpec.describe "Games", type: :request do
  
  describe "GET /games" do
    describe "GET /games" do
      it "正常なレスポンス" do
        get games_url
        expect(response).to be_successful
      end
    
      it "200レスポンスが返ってくる" do
        get games_url
        expect(response).to have_http_status "200"
      end
    end
  end
  
end

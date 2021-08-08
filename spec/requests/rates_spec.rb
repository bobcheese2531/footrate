require 'rails_helper'

RSpec.describe "Rates", type: :request do
  
  describe "GET /rate" do
    it "正常なレスポンス" do
      get rates_url
      expect(response).to be_successful
    end
    
    it "200レスポンスが返ってくる" do
      get rates_url
      expect(response).to have_http_status "200"
    end
  end
  
  describe "GET /rates/:id" do
    before do
      @user = create(:user, :bob)
      @game = create(:game)
      @rate = create(:rate, user_id: @user.id, game_id: @game.id)
    end
    it "正常なレスポンス" do
      get rate_url @rate.id
      expect(response).to be_successful
    end
    
    it "200レスポンスが返ってくる" do
      get rate_url @rate.id
      expect(response.status).to eq 200
    end
  end
  
  describe "DELETE /rates/:id" do
    before do
      @user = create(:user, :bob)
      @game = create(:game)
      @rate = create(:rate, user_id: @user.id, game_id: @game.id)
    end
      
    it "投稿を削除" do
      sign_in @user
      delete rate_url @rate
      expect(response.status).to eq 302
    end
    
    it '投稿が削除されること' do
      sign_in @user
      expect do
        delete rate_url @rate
      end.to change(Rate, :count).by(-1)
    end
    
    it '投稿一覧にリダイレクトすること' do
      sign_in @user
      delete rate_url @rate
      expect(response).to redirect_to(rates_url)
    end
    
    it 'ユーザーが一致しない場合、投稿にリダイレクトすること' do
      @user2 = create(:user, :steve)
      sign_in @user2
      delete rate_url @rate
      expect(response).to redirect_to(rate_url @rate)
    end
    
  end
end

require 'rails_helper'

RSpec.describe "Rates", type: :request do
  
  describe "GET #index" do
    it "正常なレスポンス" do
      get rates_url
      expect(response).to be_successful
    end
    
    it "200レスポンスが返ってくる" do
      get rates_url
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #show" do
    before do
      @rate = create(:rate)
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
  
  describe "GET #new" do
    context "ログインしている場合" do
      before do 
        @game = create(:game)
        @user = create(:bob)
        sign_in @user
      end
      it "リクエストが成功すること" do
        get new_rate_url(game_id: @game)
        expect(response.status).to eq 200
      end
    end
    
    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトされること" do
        @game = create(:game)
        get new_rate_url(game_id: @game)
        expect(response).to redirect_to new_user_session_url
      end
    end
    
  end
  
  describe "POST #create" do
    before do
      @game = create(:game)
      @user = create(:bob)
      sign_in @user
    end
    context "パラメーターが有効な場合" do
      before do
        @params = { rate_form: FactoryBot.attributes_for(:rate).merge(game_id: @game.id) }
      end
      it "投稿一覧へリダイレクトすること" do
        post rates_url, params: @params
        expect(response).to redirect_to rates_url
      end
      
      it  "投稿が保存されること" do
        expect do
          post rates_url, params: @params
        end.to change(Rate, :count).by(1)
      end
    end
    
    context "パラメーターが不正な場合" do
      before do
        @params = { rate_form: FactoryBot.attributes_for(:rate, :invalid).merge(game_id: @game.id) }
      end
      it "投稿が保存されないこと" do
        expect do
          post rates_url, params: @params
        end.to_not change(Rate, :count)
      end
      
      it "newにリダイレクトすること" do
        post rates_url, params: @params
        expect(response).to redirect_to new_rate_url(game_id: @game.id)
      end
    end
  end
  
  
  describe "DELETE /rates/:id" do
    before do
      @rate = create(:rate)
    end
    
    context "ユーザーが一致している場合" do
      before do 
        sign_in @rate.user
      end

      it "投稿が削除されること" do
        expect do
          delete rate_url @rate
        end.to change(Rate, :count).by(-1)
      end
      
      it "投稿一覧にリダイレクトすること" do
        delete rate_url @rate
        expect(response).to redirect_to rates_url
      end
    end
      
    context "ユーザーが一致しない場合" do
      it "投稿にリダイレクトすること" do
        @user2 = create(:steve)
        sign_in @user2
        delete rate_url @rate
        expect(response).to redirect_to rate_url @rate
      end
    end
      
    it "ログインしていない場合、ログインにリダイレクトすること" do
      delete rate_url @rate
      expect(response).to redirect_to new_user_session_url
    end
    
  end
  
  describe "GET #best_XI" do
    it "正常なレスポンス" do
      get best_XI_rates_url
      expect(response).to be_successful
    end
    
    it "200レスポンスが返ってくる" do
      get best_XI_rates_url
      expect(response.status).to eq 200
    end
  end
  
end

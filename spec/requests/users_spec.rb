require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /users/:id" do
    context "ログインしていてユーザーが一致している場合" do
      before do
        @user = create(:bob)
        sign_in @user
      end
      
      it "正常なレスポンス" do
        get user_url @user.id
        expect(response).to be_successful
      end
      
      it "200レスポンスが返ってくる" do
        get user_url @user.id
        expect(response.status).to eq 200
      end
    end
    
    context "ログインしていてユーザーが一致しない場合" do
      before do
        @user = create(:bob)
        @user2 = create(:steve)
        sign_in @user2
      end
      
      it "エラー発生" do
        get user_url @user.id
        expect(response).not_to be_successful
      end
      
      it "302レスポンスが返ってくる" do
        get user_url @user.id
        expect(response.status).to eq 302
      end
    end
    
    context "ログインしていない場合" do
      before do
        @user = create(:bob)
      end
      
      it "エラー発生" do
        get user_url @user.id
        expect(response).not_to be_successful
      end
      
      it "302レスポンスが返ってくる" do
        get user_url @user.id
        expect(response.status).to eq 302
      end
    end
  end
  
  describe "GET /users/:id/edit" do
    context "ログインしていてユーザーが一致している場合" do
      before do
        @user = create(:bob)
        sign_in @user
      end
      
      it "正常なレスポンス" do
        get edit_user_url @user.id
        expect(response).to be_successful
      end
      
      it "200レスポンスが返ってくる" do
        get edit_user_url @user.id
        expect(response.status).to eq 200
      end
    end
    
    context "ログインしていてユーザーが一致しない場合" do
      before do
        @user = create(:bob)
        @user2 = create(:steve)
        sign_in @user2
      end
      
      it "エラー発生" do
        get edit_user_url @user.id
        expect(response).not_to be_successful
      end
      
      it "302レスポンスが返ってくる" do
        get edit_user_url @user.id
        expect(response.status).to eq 302
      end
    end
    
    context "ログインしていない場合" do
      before do
        @user = create(:bob)
      end
      
      it "エラー発生" do
        get edit_user_url @user.id
        expect(response).not_to be_successful
      end
      
      it "302レスポンスが返ってくる" do
        get edit_user_url @user.id
        expect(response.status).to eq 302
      end
    end
  end
  
  describe "PUT #update" do
    before do
      @user = create(:bob)
      sign_in @user
    end
    
    context "パラメータが妥当な場合" do
      it "リクエストが成功すること" do
        put user_url @user, params: { user: FactoryBot.attributes_for(:steve) }
        expect(response.status).to eq 302
      end
      
      it "ユーザー名が更新されること" do
        expect do
          put user_url @user, params: { user: FactoryBot.attributes_for(:steve) }
        end.to change { User.find(@user.id).name }.from('Bob').to('Steve')
      end
      
      it "リダイレクトすること" do
        put user_url @user, params: { user: FactoryBot.attributes_for(:steve) }
        expect(response).to redirect_to User.last
      end
    end
    
    context "パラメータが不当な場合" do
      it "リダイレクトされること" do
        put user_url @user, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 302
      end
      
      it "ユーザー名が更新されないこと" do
        expect do
          put user_url @user, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User.find(@user.id), :name)
      end
    end
    
  end
  
end

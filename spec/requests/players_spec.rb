require 'rails_helper'

RSpec.describe "Players", type: :request do
  
  describe 'GET #new' do
    context 'ログインしている' do
      before do
        @user = create(:bob)
        @game = create(:game)
      end
      it 'リクエストが成功すること' do
        sign_in @user
        get new_player_url(game_id: @game.id)
        expect(response.status).to eq 200
      end
    end
    
    context 'ログインしていない' do
      before do
        @game = create(:game)
      end
      it 'ログイン画面へリダイレクト' do
        get new_player_url(game_id: @game.id)
        expect(response.status).to eq 302
      end
    end
  end
  
  describe 'POST #create' do
  end
  
end
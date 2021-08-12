require 'rails_helper'

RSpec.describe "Players", type: :request do
  
  describe 'GET #new' do
    before do
      @game = create(:game)
    end

    it 'ログインしている場合、リクエストが成功すること' do
      @user = create(:bob)
      sign_in @user
      get new_player_url(game_id: @game.id)
      expect(response.status).to eq 200
    end
    
    it 'ログインしていない場合、リダイレクトすること' do
      get new_player_url(game_id: @game.id)
      expect(response.status).to eq 302
    end
  end
  
  describe 'POST #create' do
  end
  
end
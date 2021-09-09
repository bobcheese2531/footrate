require 'rails_helper'

RSpec.describe RateForm, type: :model do
  describe "バリデーションテスト" do
    let(:user) { create(:user) }
    let(:game) { create(:game) }
  
    it "ホームチームとアウェイチームがある場合有効" do
      rate = build(:rate_form, user_id: user.id, game_id: game.id)
      expect(rate).to be_valid
    end
  
    it "ホームチームがない場合無効" do
      rate = build(:rate_form, user_id: user.id, game_id: game.id, home_team: "")
      rate.valid?
      expect(rate.errors[:home_team]).to include("を入力してください")
    end
  
    it "アウェイチームがない場合無効" do
      rate = build(:rate_form, user_id: user.id, game_id: game.id, away_team: "")
      rate.valid?
      expect(rate.errors[:away_team]).to include("を入力してください")
    end
  end
end

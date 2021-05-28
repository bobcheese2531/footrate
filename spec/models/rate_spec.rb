require 'rails_helper'

RSpec.describe Rate, type: :model do
  
  before do
    @user = create(:user)
    @game = create(:game, user_id: @user.id)
  end
  
  it "ポジション、選手名、感想、点数がある場合有効" do
    rate = build(:rate, game_id: @game.id)
    expect(rate).to be_valid
  end
  
  it "ポジションがない場合無効" do
    rate = build(:rate, game_id: @game.id, position: "")
    rate.valid?
    expect(rate.errors[:position]).to include("を入力してください")
  end
  
  it "選手名がない場合無効" do
    rate = build(:rate, game_id: @game.id, player_name: "")
    rate.valid?
    expect(rate.errors[:player_name]).to include("を入力してください")
  end
  
  it "感想がない場合無効" do
    rate = build(:rate, game_id: @game.id, player_text: "")
    rate.valid?
    expect(rate.errors[:player_text]).to include("を入力してください")
  end
  
  it "点数がない場合無効" do
    rate = build(:rate, game_id: @game.id, player_rate: "")
    rate.valid?
    expect(rate.errors[:player_rate]).to include("を入力してください")
  end
  
  context "ポジションの文字数制限" do
    
    it "文字数が3文字以下の場合有効" do
      rate = build(:rate, game_id: @game.id, position: "CMF")
      expect(rate).to be_valid
    end
    
    it "文字数が4文字以上の場合無効" do
      rate = build(:rate, game_id: @game.id, position: "Central Midfielder")
      rate.valid?
      expect(rate.errors[:position]).to include "は3文字以内で入力してください"
    end
    
  end
  
  context "感想の文字数制限" do
    
    it "文字数が100文字以下の場合有効" do 
      rate = build(:rate, game_id: @game.id, player_text: "a" * 100)
      expect(rate).to be_valid
    end
    
    it "文字数が101文字以上の場合無効" do
      rate = build(:rate, game_id: @game.id, player_text: "a" * 150)
      rate.valid?
      expect(rate.errors[:player_text]).to include "は100文字以内で入力してください"
    end
    
  end
  
  it "点数が文字列の場合無効" do
    rate = build(:rate, game_id: @game.id, player_rate: "one")
    rate.valid?
    expect(rate.errors[:player_rate]).to include "は数値で入力してください"
  end
    
end
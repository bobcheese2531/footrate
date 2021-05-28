require 'rails_helper'

RSpec.describe Game, type: :model do
  
  before do
    @user = create(:user)
  end
  
  it "チーム名、点数、日付、評価するチームがある場合有効" do
    game = build(:game, user_id: @user.id)
    expect(game).to be_valid
  end
  
  context "チーム名がない場合無効" do
    
      it "ホームチームがない場合無効" do 
      game = build(:game, user_id: @user.id, home_team: "")
      game.valid?
      expect(game.errors[:home_team]).to include("を入力してください")
    end
    
    it "アウェイチームがない場合無効" do
      game = build(:game, user_id: @user.id, away_team: "")
      game.valid?
      expect(game.errors[:away_team]).to include("を入力してください")
    end
    
    it "評価するチームがない場合" do
      game = build(:game, user_id: @user.id, rate_team: "")
      game.valid?
      expect(game.errors[:rate_team]).to include("を入力してください")
    end
    
  end
    
  
  context "チーム名が3 文字出でない場合無効" do
    
    it "ホームチームが2文字の場合" do 
      game = build(:game, home_team: "MC")
      game.valid?
      expect(game.errors[:home_team]).to include("は3文字で入力してください")
    end
    
    it "アウェイチームが4文字の場合" do
      game = build(:game, away_team: "ManC")
      game.valid?
      expect(game.errors[:away_team]).to include("は3文字で入力してください")
    end
    
    it "評価するチームが7文字の場合" do
      game = build(:game, rate_team: "ManCity")
      game.valid?
      expect(game.errors[:rate_team]).to include("は3文字で入力してください")
    end
    
  end
  
  context "点数がない場合無効" do
    
    it "ホームチームのスコアがない場合" do
      game = build(:game, user_id: @user.id, home_score: "")
      game.valid?
      expect(game.errors[:home_score]).to include("を入力してください")
    end
    
    it "アウェイチームのスコアがない場合" do
      game = build(:game, user_id: @user.id, away_score: "")
      game.valid?
      expect(game.errors[:away_score]).to include("を入力してください")
    end
    
  end
  
  context "点数が数字出ない場合無効" do
    
    it "ホームチームの点数が数字出ない場合" do
      game = build(:game, user_id: @user_id, home_score: "one")
      game.valid?
      expect(game.errors[:home_score]).to include("は数値で入力してください")
    end
    
    it "アウェイチームの点数が数字出ない場合" do
      game = build(:game, user_id: @user_id, away_score: "一")
      game.valid?
      expect(game.errors[:away_score]).to include("は数値で入力してください")
    end
    
  end
  
  it "日付がない場合無効" do
    game = build(:game, user_id: @user.id, date: "")
    game.valid?
    expect(game.errors[:date]).to include("を入力してください")
  end
  
end

require 'rails_helper'

RSpec.describe Player, type: :model do
    
  before do
    @user = create(:user)
    @game = create(:game)
    @rate = create(:rate, user_id: @user.id, game_id: @game.id)
  end
  
  it "背番号、ポジション、選手名、点数、チームIDがある場合有効" do
    player = build(:player, rate_id: @rate.id)
    expect(player).to be_valid
  end
  
  it "背番号がない場合無効" do
    player = build(:player, rate_id: @rate.id, shirtnumber: "")
    player.valid?
    expect(player.errors[:shirtnumber]).to include("を入力してください")
  end
  
  it "ポジションがない場合無効" do
    player = build(:player, rate_id: @rate.id, position: "")
    player.valid?
    expect(player.errors[:position]).to include("を入力してください")
  end
  
  it "選手名がない場合無効" do
    player = build(:player, rate_id: @rate.id, name: "")
    player.valid?
    expect(player.errors[:name]).to include("を入力してください")
  end
  
  it "チームIDがない場合無効" do
    player = build(:player, rate_id: @rate.id, team_id: "")
    player.valid?
    expect(player.errors[:team_id]).to include("を入力してください")
  end
  
  it "点数がない場合無効" do
    player = build(:player, rate_id: @rate.id, player_rate: "")
    player.valid?
    expect(player.errors[:player_rate]).to include("を入力してください")
  end

  it "点数が文字列の場合無効" do
    player = build(:player, rate_id: @rate.id, player_rate: "one")
    player.valid?
    expect(player.errors[:player_rate]).to include "は数値で入力してください"
  end
 
end

require 'rails_helper'

RSpec.describe GamesHelper, type: :helper do
  it "game_date(date)" do
    expect(helper.game_date("2021-08-21T11:30:00Z")).to eq("2021/08/21")
  end
  
  it "game_date(date)" do
    expect(helper.get_time("2021-08-21T11:30:00Z")).to eq("20:30")
  end
  
  context "scorer?(scorer, player, type)" do
    it "オウンゴール" do
      expect(helper.scorer?("Messi", "Messi", "OWN")).to eq("OG")
    end
    
    it "通常ゴール" do
      expect(helper.scorer?("Messi", "Messi", "REGULAR")).to eq("G")
    end
    
    it "PK" do
      expect(helper.scorer?("Messi", "Messi", "PENALTY")).to eq("G")
    end
    
    it "名前が一致しない場合" do
      expect(helper.scorer?("Messi", "Neymar", "PENALTY")).to eq(nil)
    end
    
  end
  
  context "assist?(assist, player)" do
    it "名前が一致する場合" do
      expect(helper.assist?("Messi", "Messi")).to eq("A")
    end
  
    it "名前が一致しない場合" do
      expect(helper.assist?("Messi", "Neymar")).to eq(nil)
    end
  end
  
  it "match_scheduled?(status)" do
    expect(helper.match_scheduled?("SCHEDULED")).to be true
  end
  
  it "match_finished?(status)" do
    expect(helper.match_finished?("FINISHED")).to be true
  end
  
  
  
end

require 'rails_helper'

RSpec.describe GamesHelper, type: :helper do
  context "competiton_title(code)" do
    it "プレミアリーグ" do
      expect(helper.competiton_title("PL")).to eq("プレミアリーグ")
    end
    
    it "ラ・リーガ" do
      expect(helper.competiton_title("PD")).to eq("ラ・リーガ")
    end
    
    it "ブンデスリーガ" do
      expect(helper.competiton_title("BL1")).to eq("ブンデスリーガ")
    end
    
    it "セリエＡ" do
      expect(helper.competiton_title("SA")).to eq("セリエＡ")
    end
    
    it "リーグ・アン" do
      expect(helper.competiton_title("FL1")).to eq("リーグ・アン")
    end
    
    it "チャンピオンズリーグ" do
      expect(helper.competiton_title("CL")).to eq("チャンピオンズリーグ")
    end
    
    it "ユーロ" do
      expect(helper.competiton_title("EC")).to eq("ユーロ2020")
    end
  end
  
  it "game_date(date)" do
    expect(helper.match_date("2021-08-21T11:30:00Z")).to eq("2021/08/21")
  end
  
  it "game_date(date)" do
    expect(helper.match_time("2021-08-21T11:30:00Z")).to eq("20:30")
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

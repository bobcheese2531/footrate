require 'rails_helper'

RSpec.describe "Games", type: :request do
  
  describe "GET /games" do
    describe "GET /games" do
      it "正常なレスポンス" do
        get games_url
        expect(response).to be_successful
      end
    
      it "200レスポンスが返ってくる" do
        get games_url
        expect(response.status).to eq 200
      end
    end
    
    describe "GET /game/:id" do
      context "Gameが存在している場合" do
        before do
          @game = create(:game)
        end
        it 'リクエストが成功すること' do
          get game_url @game.id
          expect(response.status).to eq 200
        end
      end
      
      context "Gameが存在していな場合" do
        it 'Gameが保存されること' do
          expect(change(Game, :count).by(1))
        end
      end
    end
    
    describe "GET /games/league" do
      context "プレミアリーグ" do
        it "正常なレスポンス" do
          get league_games_url(code: "PL", year: "", title: "プレミアリーグ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "PL", year: "", title: "プレミアリーグ", day: 1)
          expect(response.status).to eq 200
        end
      end
      
      context "ラ・リーガ" do
        it "正常なレスポンス" do
          get league_games_url(code: "PD", year: "", title: "ラ・リーガ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "PD", year: "", title: "ラ・リーガ", day: 1)
          expect(response.status).to eq 200
        end
      end
      
      context "ブンデスリーガ" do
        it "正常なレスポンス" do
          get league_games_url(code: "BL1", year: "", title: "ブンデスリーガ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "BL1", year: "", title: "ブンデスリーガ", day: 1)
          expect(response.status).to eq 200
        end
      end
      
      context "セリエＡ" do
        it "正常なレスポンス" do
          get league_games_url(code: "SA", year: "", title: "セリエＡ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "SA", year: "", title: "セリエＡ", day: 1)
          expect(response.status).to eq 200
        end
      end
      
      context "リーグ・アン" do
        it "正常なレスポンス" do
          get league_games_url(code: "FL1", year: "", title: "リーグ・アン", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "FL1", year: "", title: "リーグ・アン", day: 1)
          expect(response.status).to eq 200
        end
      end
      
    end
    
    describe "GET /games/cl" do
      it "正常なレスポンス" do
        get cl_games_url(code: "CL", year: "", title: "チャンピオンズリーグ", stage: "GROUP_STAGE", day: 1)
        expect(response).to be_successful
      end
    
      it "200レスポンスが返ってくる" do
        get cl_games_url(code: "CL", year: "", title: "チャンピオンズリーグ", stage: "GROUP_STAGE", day: 1)
        expect(response.status).to eq 200
      end
    end
    
    describe "GET /games/euro" do
      it "正常なレスポンス" do
        get euro_games_url(code: "EC", year: "", title: "ユーロ2020", stage: "GROUP_STAGE", day: 1)
        expect(response).to be_successful
      end
    
      it "200レスポンスが返ってくる" do
        get euro_games_url(code: "EC", year: "", title: "ユーロ2020", stage: "GROUP_STAGE", day: 1)
        expect(response.status).to eq 200
      end
    end
    
  end
  
end

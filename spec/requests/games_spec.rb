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
        expect(response).to have_http_status "200"
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
          expect(response).to have_http_status "200"
        end
      end
      
      context "ラ・リーガ" do
        it "正常なレスポンス" do
          get league_games_url(code: "PD", year: "", title: "ラ・リーガ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "PD", year: "", title: "ラ・リーガ", day: 1)
          expect(response).to have_http_status "200"
        end
      end
      
      context "ブンデスリーガ" do
        it "正常なレスポンス" do
          get league_games_url(code: "BL1", year: "", title: "ブンデスリーガ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "BL1", year: "", title: "ブンデスリーガ", day: 1)
          expect(response).to have_http_status "200"
        end
      end
      
      context "セリエＡ" do
        it "正常なレスポンス" do
          get league_games_url(code: "SA", year: "", title: "セリエＡ", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "SA", year: "", title: "セリエＡ", day: 1)
          expect(response).to have_http_status "200"
        end
      end
      
      context "リーグ・アン" do
        it "正常なレスポンス" do
          get league_games_url(code: "FL1", year: "", title: "リーグ・アン", day: 1)
          expect(response).to be_successful
        end
    
        it "200レスポンスが返ってくる" do
          get league_games_url(code: "FL1", year: "", title: "リーグ・アン", day: 1)
          expect(response).to have_http_status "200"
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
        expect(response).to have_http_status "200"
      end
    end
    
    describe "GET /games/euro" do
      it "正常なレスポンス" do
        get euro_games_url(code: "EC", year: "", title: "ユーロ2020", stage: "GROUP_STAGE", day: 1)
        expect(response).to be_successful
      end
    
      it "200レスポンスが返ってくる" do
        get euro_games_url(code: "EC", year: "", title: "ユーロ2020", stage: "GROUP_STAGE", day: 1)
        expect(response).to have_http_status "200"
      end
    end
    
  end
  
end

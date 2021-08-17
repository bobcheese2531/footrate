require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /create" do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post game_comments_url, params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do
           post game_comments_url, params: { comment: FactoryBot.attributes_for(:comment) }
        end.to change(Comment, :count).by(1)
      end
    end
  end
end

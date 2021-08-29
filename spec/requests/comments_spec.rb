require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /create" do
    context "サインインしているとき" do
      before do
        @comment = create(:comment)
        sign_in @comment.user
      end
      
      it "リクエストが成功すること" do
        post game_comments_url(game_id: @comment.game_id), params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response.status).to eq 302
      end

      it "コメントが保存されること" do
        expect do
           post game_comments_url(game_id: @comment.game_id), params: { comment: FactoryBot.attributes_for(:comment) }
        end.to change(Comment, :count).by(1)
      end
    end
    
    context "サインインしていない時" do
      before do
        @comment = create(:comment)
      end
      
      it "リダイレクトされること" do
        post game_comments_url(game_id: @comment.game_id), params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response.status).to eq 302
      end

      it "コメントが保存されないこと" do
        expect do
           post game_comments_url(game_id: @comment.game_id), params: { comment: FactoryBot.attributes_for(:comment) }
        end.to change(Comment, :count).by(0)
      end
    end
  end
  
  describe "DELETE /destroy" do
    context "サインインしているとき" do
      before do
        @comment = create(:comment)
        sign_in @comment.user
      end
      
      it "リクエストが成功すること" do
        delete game_comment_url @comment.game_id, @comment
        expect(response.status).to eq 302
      end

      it "コメントが削除されること" do
        expect do
          delete game_comment_url  @comment.game_id, @comment
        end.to change(Comment, :count).by(-1)
      end
      
      it "ユーザーが一致しない場合リダイレクト" do
        @user2 = create(:steve)
        sign_in @user2
        delete game_comment_url @comment.game_id, @comment
        expect(response.status).to eq 302
      end
      
    end
    
    context "サインインしていない時" do
      before do
        @comment = create(:comment)
      end
      
      it "リダイレクトされること" do
        delete game_comment_url  @comment.game_id, @comment
        expect(response.status).to eq 302
      end

      it "コメントが保存されないこと" do
        expect do
          delete game_comment_url  @comment.game_id, @comment
        end.to_not change(Comment, :count)
      end
    end
  end
  
end

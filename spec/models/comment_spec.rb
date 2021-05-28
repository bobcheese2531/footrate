require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  before do
    @user = create(:user)
    @game = create(:game, user_id: @user.id)
  end
  
  it "コメントがある場合有効" do
    comment = build(:comment, game_id: @game.id, user_id: @user.id)
    expect(comment).to be_valid
  end  
  
  it "コメントがない場合無効" do
    comment = build(:comment, game_id: @game.id, user_id: @user.id, comment: "")
    comment.valid?
    expect(comment.errors[:comment]).to include "を入力してください"
  end
  
  context "コメントの文字数制限" do
    
    it "文字数が100文字以下の場合有効" do 
      comment = build(:comment, game_id: @game.id, user_id: @user.id, comment: "a" * 100)
      expect(comment).to be_valid
    end
    
    it "文字数が101文字以上の場合無効" do
      comment = build(:comment, game_id: @game.id, user_id: @user.id,  comment: "a" * 150)
      comment.valid?
      expect(comment.errors[:comment]).to include "は100文字以内で入力してください"
    end
    
  end
  
end

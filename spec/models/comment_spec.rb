require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーションテスト" do
    it "コメントがある場合有効" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  
    it "コメントがない場合無効" do
      comment = build(:comment, content: "")
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end
  end
end

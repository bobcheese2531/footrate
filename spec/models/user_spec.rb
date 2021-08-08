require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do  
    it "名前、メールアドレス、パスワードがある場合有効" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前がない場合は無効" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  
    it "名前が重複している場合無効" do
      user1 = create(:user)
      user2 = build(:user)
      user2.valid?
      expect(user2.errors[:name]).to include("はすでに存在します")
    end
  
    it "メールアドレスがない場合無効" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  
    it "パスワードがない場合無効" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  
    it "好きなチームがない場合無効" do
      user = build(:user, like_team: "")
      user.valid?
      expect(user.errors[:like_team]).to include("を入力してください")
    end
  end
end
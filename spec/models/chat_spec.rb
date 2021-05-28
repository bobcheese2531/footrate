require 'rails_helper'

RSpec.describe Chat, type: :model do
  
  before do 
    @user = create(:user)
    @room = create(:room)
  end
  
  it "メッセージがある場合有効" do
    chat = build(:chat, user_id: @user.id, room_id: @room.id)
    expect(chat).to be_valid
  end
  
  it "メッセージがない場合無効" do
    chat = build(:chat, user_id: @user.id, room_id: @room.id, message: "")
    chat.valid?
    expect(chat.errors[:message]).to include("を入力してください")
  end
  
  context "メッセージの文字数制限" do
    
    it "文字数が100文字以下の場合有効" do
      chat = build(:chat, user_id: @user.id, room_id: @room.id, message: "a" * 100)
      expect(chat).to be_valid
    end
    
    it "文字数が101文字以上の場合無効" do
      chat = build(:chat, user_id: @user.id, room_id: @room.id, message: "a" * 150)
      chat.valid?
      expect(chat.errors[:message]).to include "は100文字以内で入力してください"
    end
    
  end
  
end
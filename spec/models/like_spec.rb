require 'rails_helper'

RSpec.describe Like, type: :model do
  
  it "一つの投稿に対して一人はいいね一つしかできない" do 
    user = create(:user)
    game = create(:game, user_id: user.id)
    like1 = create(:like, game_id: game.id, user_id: user.id)
    like2 = build(:like, game_id: game.id, user_id: user.id)
    expect(like2).to be_invalid
  end
  
end

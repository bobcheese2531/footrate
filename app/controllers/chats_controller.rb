class ChatsController < ApplicationController
    
  def show
    find_room
    set_or_create_room
    set_chats
  end
    
  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    redirect_back(fallback_location: root_path)
  end
  

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
  
  def find_room
    @user = User.find(params[:id])  #チャットするユーザー
    rooms = current_user.user_rooms.pluck(:room_id)
    @user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
  end
  
  def set_or_create_room
    unless @user_rooms.nil?
      @room = @user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
  end
  
  def set_chats
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end
    
end
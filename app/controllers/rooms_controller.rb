class RoomsController < ApplicationController
  def create
    @room = Room.create
    @myUserRoom = UserRoom.create(user_id:current_user.id,room_id:@room.id)
    @theOtherUserRoom = UserRoom.create(
      params.require(:user_room).permit(:user_id,:room_id).merge(room_id:@room.id)
    )
    redirect_to room_path(@room.id)
  end
  
  def show
  end
end

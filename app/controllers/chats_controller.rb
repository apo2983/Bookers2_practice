class ChatsController < ApplicationController
  def create
    chat_new = Chat.new(chat_params)
    chat.save
  end

  private
  def chat_params
    params.require(:chat).permit(:message)
  end
end

class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create #ルーム新規登録
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to root_path
    else
      flash[:alert] = "ルーム登録に失敗しました"
      render 'new'
    end
  end

  def show 
    @room = Room.find(params[:id])
  end

  def posts
    @rooms = Room.where(user_id:current_user.id)
  end

  def search
    @user = User.all
    @rooms = Room.search(params[:search])
  end

  private
  def room_params
    params.require(:room).permit(:name, :address, :introduction , :price, :room_image)
  end

end

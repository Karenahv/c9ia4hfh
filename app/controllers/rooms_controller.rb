class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  @room = Room.find(params[:id])
  end

def update
  @room = Room.find(params[:id])
  if @room.update_attributes(room_params)
    flash[:notice] = 'Profile was successfully updated.'
    redirect_to rooms_path
  else
    render "edit"
  end
end
def destroy
  id = params[:id]
  @room = Room.find(id)
  @room.destroy
  redirect_to "/rooms"
end
  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url)
    end
end

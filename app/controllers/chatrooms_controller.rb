class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :destroy]

  # GET /chatrooms/1
  def show
    if ( params[:user_id].nil? && logged_in? && current_user.id == params[:user_id].to_i)
      @post = Post.find(params[:post_id])
      @post.destory
    end
    redirect_to posts_url if @chatroom.nil?
    # if @chatroom.visited
    #  redirect_to destory(@chatroom)
    # else
    #  @chatroom.update(visited: true)
    # end
  end

  def to_boolean(str)
    str == 'true'
  end

  # POST /chatrooms
  def create
    @post = Post.find(params[:post_id].to_i)
    @post.update(guest_id: params[:guest_id].to_i)
    @chatroom = Chatroom.new({ exists: to_boolean(params[:exists]), visited: false, duration: 2*params[:duration].to_i, 
      user_id: @post.user_id, guest_id: params[:guest_id] })
    if @chatroom.save
      if(Chatroom.exists? (@chatroom.id-1) )
        Chatroom.destroy(@chatroom.id-1)
      end
      redirect_to @chatroom, notice: 'Chatroom was successfully created.'
    else
      render :new
    end
  end

  # GET /chatrooms/1
  def join
    @chatroom = Chatroom.where(:user_id => params[:user_id].to_i).where(:guest_id => params[:guest_id].to_i)
    @post = Post.find(params[:post_id].to_i)
    @post.destory
    params.merge(:id => @chatroom.id)
    redirect_to @chatroom
  end

  # DELETE /chatrooms/1
  def destroy
    @chatroom.destroy
    redirect_to posts_url #, notice: 'Chatroom was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_params
      params.require(:chatroom).permit(:exists, :duration)
    end
end

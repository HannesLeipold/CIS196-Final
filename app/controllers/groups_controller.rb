class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    @users = @group.users
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  def add_user
    @user = User.find(params[:user_id].to_i)
    @group = Group.find(params[:group_id].to_i)
    if !@group.users.exists?(@user.id)
      @group.users.append @user 
      redirect_to @group, notice: 'User has been added to group'
    else 
      redirect_to @group
    end
  end

  def delete_user
    @group = Group.find(params[:group_id].to_i)
    if !@group.users.exists?(params[:user_id].to_i)
      redirect_to @group
    else
      @group.users.destroy(params[:user_id].to_i)
      redirect_to @group, notice: 'User has been deleted from group'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name, :info, :user_id)
    end
end

class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  def index
    @groups = Group.includes(:entities).where(user_id: current_user.id)
    @groups = Group.order(created_at: :desc)
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

 def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'This group was created successfully.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'This group was  destroyed successfully.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'This group was updated successfully.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :icon)
    end
end
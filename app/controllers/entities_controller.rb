class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @entities = Entity.includes(:groups).where(user_id: current_user.id).order(created_at: :desc)
  end

  def show; end

  def new
    @entity = Entity.new
    @categories = Group.where(user_id: current_user.id)
  end

  def edit; end

  def create
    params = entity_params
    @entity = Entity.new(name: params[:name], amount: params[:amount])
    @entity.user_id = current_user.id
    @categories_ids = params[:group_ids]
    @categories_ids.each do |id|
      group = Group.find(id) unless id == ''
      @entity.groups.push(group) unless group.nil?
    end
    respond_to do |format|
      if @entity.save
        format.html do
          redirect_to groups_url(params[:group_id]), notice: 'This transaction was created successfully.'
        end
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'This transaction was updated successfully.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to groups_url(params[:group_id]), notice: 'This transaction was destryed successfuly.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end

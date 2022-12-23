# frozen_string_literal: true

# GroupsController
class GroupsController < ApplicationController
  def index
    @groups = Group.where(user: current_user).includes(:group_purchases).order(created_at: :desc).limit(4)
    @name = current_user.name
  end

  def older_index
    @groups = Group.where(user: current_user).includes(:group_purchases).order(created_at: :asc)
  end

  def show
    @group = Group.find(params[:id])
    @group_purchases = GroupPurchase.includes(:purchase).where(group_id: @group).order(created_at: :desc)
    @total = 0
    @group_purchases.each { |p| @total += p.purchase.amount }
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.user = current_user
    if @group.save
      redirect_to root_path, notice: 'Group created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

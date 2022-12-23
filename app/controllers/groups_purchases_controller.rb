class GroupsPurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @groups = Group.where(user: current_user)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    if @purchase.save
      GroupPurchase.create(purchase_id: @purchase.id, group_id: params[:group])
      redirect_to group_path(params[:group]), notice: 'purchase created'
    else
      flash[:notice] = 'Error during creation'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end

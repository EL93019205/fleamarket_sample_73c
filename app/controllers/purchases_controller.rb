class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end
  def create
  end

  private

  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

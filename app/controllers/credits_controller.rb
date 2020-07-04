class CreditsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @credit = Credit.new
  end

  def create
    user = User.find(params[:user_id])
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to edit_user_path(user), notice: 'クレジットカード情報を登録しました'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @credit = Credit.find(params[:user_id])
  end

  def update
    @credit = Credit.find(params[:user_id])
    if @credit.update(credit_params)
      redirect_to edit_user_path(@credit), notice: 'クレジットカード情報を更新しました'
    else
      render :edit
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:card_fullname, :card_number, :expiration, :security_code).merge(user_id: params[:user_id])
  end

end
